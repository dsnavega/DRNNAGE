# This file is part of DRNNAGE
#
# Copyright (C) 2021, David Senhora Navega
#
# DRNNAGE is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# DRNNAGE is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with DRNNAGE. If not, see <http://www.gnu.org/licenses/>.
#
# David Senhora Navega
# Laboratory of Forensic Anthropology
# Department of Life Sciences
# University of Coimbra
# Calçada Martim de Freitas, 3000-456, Coimbra
# Portugal

#' @author David Senhora Navega
#'
shinyServer(function(input, output, session) {

  # Read data list from .rds and assign it to server scope
  data <- readr::read_rds(file = "data/data.rds")
  for(name in names(data)) {
    assign(x = name, value = data[[name]])
  }
  rm(data)

  trait_tbl <- function(input, traits) {
    trait_tbl <- tibble::tibble_row()
    for(trait in traits) {
      trait_tbl[[trait]] <- suppressWarnings(as.numeric(input[[trait]]))
    }
    return(trait_tbl)
  }
  paired_pooler <- function(x, y) {

    pooling <- Vectorize(
      function(x, y) {

        if(is.na(x)) {
          return(y)
        } else {
          return(x)
        }

      }, vectorize.args = c("x", "y")
    )

    for(i in names(x)) {
      x[[i]] <- pooling(x[[i]], y[[i]])
    }

    return(x)

  }

  # User data from UI input(s) ----
  current_case <- shiny::reactive({

    # Axial traits
    ax_tbl <- trait_tbl(input, ax_traits)
    # Left side traits
    lt_tbl <- trait_tbl(input, lt_traits)
    names(lt_tbl) <- ap_traits
    # Right side traits
    rt_tbl <- trait_tbl(input, rt_traits)
    names(rt_tbl) <- ap_traits
    # Pool paired traits
    ap_tbl <- paired_pooler(lt_tbl, rt_tbl)
    case_tbl <- dplyr::bind_cols(ax_tbl, ap_tbl)

    return(case_tbl)

  })

  # Analyze ----
  shiny::observeEvent(input$btn_analyze, {



    # Current Case
    x <- current_case()
    # Available Traits
    ntraits <- sum(!is.na(x))
    traits <- names(x)[!is.na(x)]

    # Parameters
    alpha <- as.numeric(input$alpha)
    seed <- as.numeric(input$seed)
    width <- as.numeric(input$width)
    depth <- as.numeric(input$depth)

    shiny::withProgress(message  = "Analyzing data...", expr = {

      set.seed(seed)

      shiny::incProgress(message = "Fitting neural model ....")
      # Build Network Model
      nnet_model <- rwnnet::rwnnet(
        algorithm = input$algorithm,
        size = rep(width, depth),
        x = X[, traits], y = Y
      )

      # LOOCV for Uncertainity Modelling and Model Assessment
      loocv = rwnnet:::predict.rwnnet(nnet_model)

      shiny::incProgress(message = "Fitting uncertainty models ....")
      # Regression Uncertainty Modelling (Truncated Gaussian & Conformal)
      tg_rum <- rumr::rumr(
        known = Y, predicted = loocv,
        type = "gaussian", interval = c(16, 104)
      )

      cp_rum <- rumr::rumr(
        known = Y, predicted = loocv,
        type = "conformal", interval = c(16, 104)
      )

      lc_rum <- rumr::rumr(
        known = Y, predicted = loocv,
        type = "local", interval = c(16, 104),
        alpha = alpha
      )

      shiny::incProgress(message = "Estimating age-at-death ....")

      # Age-at-Death Estimation ----
      estimate <- rwnnet:::predict.rwnnet(nnet_model, x[, traits])
      tg_int <- rumr:::predict.rumr(tg_rum, estimate, alpha)
      cp_int <- rumr:::predict.rumr(cp_rum, estimate, alpha)
      lc_int <- rumr:::predict.rumr(lc_rum, estimate, alpha)

      int_tbl <- data.frame(
        c("Truncated Gaussian", "Conformal Prediction", "Local"),
        round(rbind(tg_int, cp_int, lc_int)[, c("lower", "upper")], digits = 3)
      )
      colnames(int_tbl) <- c("Uncertainty", "Lower", "Upper")
      rownames(int_tbl) <- NULL

      pred_tbl <- cbind(estimate, rbind(colMeans(int_tbl[,-1])))
      colnames(pred_tbl) <- c("Estimate", "Lower", "Upper")

      output$tbl_pred <- function (){
        caption <- paste0("Predicted Age-at-Death")
        pred_tbl %>%
          kableExtra::kable(caption = caption) %>%
          kableExtra::kable_styling(
            bootstrap_options = "striped",
            full_width = TRUE,
          )
      }

      output$tbl_int <- function() {
        caption <- paste0("Predictive Interval (", round((1-alpha) * 100),"%)")
        int_tbl %>%
          kableExtra::kable(caption = caption) %>%
          kableExtra::kable_styling(
            bootstrap_options = "striped",
            full_width = TRUE,
          )
      }

      output$plt_tg_rum <- shiny::renderPlot({
        rumr:::plot.rumr(
          x = tg_rum, predicted = estimate,
          alpha = alpha, label = "Age-at-Death", normalize = F
        )
      })

      shiny::incProgress(message = "Assessing neural model ....")
      # Model Assessment ----
      rma_rum <- switch(input$type,
        gaussian = {tg_rum},
        conformal = {cp_rum},
        local = {lc_rum}
      )

      rma_int <- rumr:::predict.rumr(rma_rum, alpha = alpha)

      output$tbl_rma <- function () {

        rma_tbl <- rmar::rmar(
          known = Y, predicted = rma_int,
          interval = c(16, 104), digits = 3
        )

        caption <- "Regression Model Assessment (LOOCV)"
        rma_tbl %>%
          dplyr::bind_rows() %>%
          kableExtra::kable(caption = caption,format = "html") %>%
          kableExtra::kable_styling(
            bootstrap_options = "striped",
          )

      }

      output$plt_accu <- shiny::renderPlot({
        rmar::rma_accuracy_plot(
          known = Y, predicted = loocv,
          interval = c(16, 104), label = "Age-at-Death"
        )
      })

      output$plt_bias <- shiny::renderPlot({
        rmar::rma_bias_plot(
          known = Y, predicted = loocv,
          interval = c(16, 104), label = "Age-at-Death"
        )
      })

      output$plt_effi <- shiny::renderPlot({
        rmar::rma_efficiency_plot(
          known = Y, predicted = rma_int,
          interval = c(16, 104)
        )
      })

    })

  })

})
