# This file is part of DRNNAGE
#
# Copyright (C) 2022, David Senhora Navega
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

  # Global ----
  # Load magrittr library, runs from the inst/app environment
  library(magrittr)

  # Read data list from .rds and assign it to server scope
  data <- readr::read_rds(file = "data/data.rds")

  for(name in names(data)) {
    assign(x = name, value = data[[name]])
  }

  # Helpers ----

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

  # Build UI Components ----
  output$estimateUI <- shiny::renderUI({

    # Current Case
    x <- current_case()
    # Available Traits
    ntraits <- sum(!is.na(x))
    traits <- names(x)[!is.na(x)]

    shiny::validate(
      shiny::need(
        expr = ntraits >= 2,
        message = "At least two traits needed to create a neural model."
      )
    )

    shiny::tagList(
      shiny::br(),
      shiny::fluidRow(
        shiny::br(),
        shiny::column(width = 4,
          shiny::br(),
          shiny::tableOutput("tbl_pred"),
          shiny::br(),
          shiny::br(),
          shiny::tableOutput("tbl_int")
        ),
        shiny::column(width = 7, offset = 1,
          shiny::br(),
          shiny::plotOutput("plt_tg_rum")
        ),
        shiny::br()
      )
    )

  })

  output$explainUI <- shiny::renderUI({

    # Current Case
    x <- current_case()
    # Available Traits
    ntraits <- sum(!is.na(x))
    traits <- names(x)[!is.na(x)]

    shiny::validate(
      shiny::need(
        expr = ntraits >= 2,
        message = "At least two traits needed to create a linear approximation."
      )
    )

    shiny::tagList(
      shiny::br(),
      shiny::fluidRow(
        column(width = 6,
          shiny::tableOutput("tbl_ls_summary"),
          shiny::br(),
          shiny::tableOutput("tbl_ls_model")
        ),
        column(width = 6,
          shiny::tableOutput("tbl_ls_pred"),
          shiny::br(),
          shiny::tableOutput("tbl_ls_cont")
        )
      )
    )

  })

  output$assessUI <- shiny::renderUI({

    # Current Case
    x <- current_case()
    # Available Traits
    ntraits <- sum(!is.na(x))
    traits <- names(x)[!is.na(x)]

    shiny::validate(
      shiny::need(
        expr = ntraits >= 2,
        message = "At least two traits needed to create a neural model."
      )
    )

    shiny::tagList(
      shiny::fluidRow(
        shiny::column(width = 12, shiny::tableOutput("tbl_rma"))
      ),
      shiny::br(),
      shiny::fluidRow(
        column(width = 6, shiny::plotOutput("plt_bias")),
        column(width = 6, shiny::plotOutput("plt_effi"))
      )
    )

  })

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

    # Parameters
    alpha <- as.numeric(input$alpha)
    seed <- as.numeric(input$seed)
    width <- as.numeric(input$width)
    depth <- as.numeric(input$depth)
    exponent <- as.numeric(input$exponent)
    eta <- as.numeric(input$eta)
    full_width <- TRUE

    # Current Case
    x <- current_case()
    # Available Traits
    ntraits <- sum(!is.na(x))
    traits <- names(x)[!is.na(x)]

    shiny::validate(
      shiny::need(
        expr = ntraits >= 2,
        message = "At least two traits required."
      )
    )

    shiny::withProgress(message  = "Analyzing data...", expr = {

      set.seed(seed)
      shiny::incProgress(message = "Fitting neural model ....")

      # Build Neural Network and Linear Surrogate Models
      nnet_model <- rwnnet::rwnnet(
        algorithm = input$algorithm,
        size = rep(width, depth),
        x = X[, traits], y = Y,
        eta = eta, flat = T, skip = T
      )

      loocv <- rwnnet:::predict.rwnnet(nnet_model)

      ls_model <- lsmr::lsmr(x = X[,traits], y = loocv)

      # LOOCV for Uncertainty Modelling and Model Assessment

      shiny::incProgress(message = "Fitting uncertainty models ....")

      # Regression Uncertainty Modelling
      cp_rum <- rumr::rumr(
        known = Y, predicted = loocv,
        type = "conformal", signed = T,
        interval = c(18, 102), exponent = exponent
      )

      tg_rum <- rumr::rumr(
        known = Y, predicted = loocv,
        type = "gaussian", interval = c(18, 102), exponent = exponent
      )

      shiny::incProgress(message = "Estimating age-at-death ....")

      # Age-at-Death Estimation ----
      estimate <- rwnnet:::predict.rwnnet(nnet_model, x[, traits])
      estimate <- rumr:::clamp_value(estimate, c(18, 102))

      cp_int <- rumr:::predict.rumr(cp_rum, estimate, alpha)
      tg_int <- rumr:::predict.rumr(tg_rum, estimate, alpha)

      int_tbl <- data.frame(
        c("Conformal Prediction", "Truncated Gaussian"),
        round(rbind(cp_int, tg_int)[, c("lower", "upper")], digits = 3)
      )
      colnames(int_tbl) <- c("Uncertainty Model", "Lower", "Upper")
      rownames(int_tbl) <- NULL

      pred_tbl <- round(
        cbind(estimate, rbind(colMeans(int_tbl[,-1]))), digits = 3
      )
      colnames(pred_tbl) <- c("Estimate", "Lower", "Upper")

      tbl_pred <- shiny::reactive({
        caption <- paste0("Predicted Age-at-Death")
        kableExtra::kable_styling(
          kable_input =  kableExtra::kable(x = pred_tbl, caption = caption),
          bootstrap_options = "striped", full_width = full_width
        )
      })

      output$tbl_pred <- shiny::renderText({
        tbl_pred()
      })

      tbl_int <- shiny::reactive({
        caption <- paste0(
          "Predictive Interval (", round((1-alpha) * 100),"%)"
        )

        kableExtra::kable_styling(
          kable_input =  kableExtra::kable(x = int_tbl, caption = caption),
          bootstrap_options = "striped",
          full_width = full_width
        )
      })

      output$tbl_int <- shiny::renderText({
        tbl_int()
      })

      # Plot Truncated Gaussian
      plt_tg_rum <- shiny::reactive({
        rumr:::plot.rumr(
          x = tg_rum, predicted = estimate,
          alpha = alpha, label = "Age-at-Death", normalize = FALSE, digits = 3
        )
      })

      output$plt_tg_rum <- shiny::renderPlot({
        plt_tg_rum()
      })

      shiny::incProgress(message = "Assessing neural model ....")
      # Model Assessment ----

      cp_int <- rumr:::predict.rumr(cp_rum, alpha = alpha)
      tg_int <- rumr:::predict.rumr(tg_rum, alpha = alpha)

      rma_int <- (cp_int + tg_int) / 2

      tbl_rma <- shiny::reactive({

        rma_tbl <- rmar::rmar(
          known = Y, predicted = rma_int,
          interval = c(18, 102), digits = 3
        )

        caption <- "Regression Model Assessment (LOOCV)"
        kableExtra::kable_styling(
          kable_input = kableExtra::kable(
            x = dplyr::bind_rows(rma_tbl), caption = caption
          ),
          bootstrap_options = "striped", full_width = full_width
        )

      })

      output$tbl_rma <- shiny::renderText({
        tbl_rma()
      })

      plt_accu <- shiny::reactive({
        rmar::rma_accuracy_plot(
          known = Y, predicted = loocv,
          interval = c(18, 102), label = "Age-at-Death"
        )
      })

      output$plt_accu <- shiny::renderPlot({
        plt_accu()
      })

      plt_bias <- shiny::reactive({
        rmar::rma_bias_plot(
          known = Y, predicted = loocv,
          interval = c(18, 102), label = "Age-at-Death"
        )
      })

      output$plt_bias <- shiny::renderPlot({
        plt_bias()
      })

      plt_effi <- shiny::reactive({
        rmar::rma_efficiency_plot(
          known = Y, predicted = rma_int,
          interval = c(18, 102)
        )
      })

      output$plt_effi <- shiny::renderPlot({
        plt_effi()
      })

      # Linear Surrogate Model ----
      shiny::incProgress(message = "Assessing linear surrogate ....")

      # Linear Surrogate Summary
      tbl_ls_summary <- shiny::reactive({

        ls_tbl <- ls_model$assessment %>%
          dplyr::mutate_if(is.numeric, round, digits = 3)

        caption <- "Surrogate Model Assessment"
        kableExtra::kable_styling(
          kable_input = kableExtra::kable(
            x = dplyr::bind_rows(ls_tbl), caption = caption, align = "c"
          ),
          bootstrap_options = "striped", full_width = full_width
        )
      })

      output$tbl_ls_summary <- shiny::renderText({
        tbl_ls_summary()
      })

      tbl_ls_model <- shiny::reactive({
        caption <- "Linear Surrogate Model"

        ls_tbl <- ls_model$summary %>%
          dplyr::arrange(rank) %>%
          dplyr::rename(Trait = feature) %>%
          dplyr::rename(CAR = estimate) %>%
          dplyr::rename(Omega = omega) %>%
          dplyr::mutate(Cumulative = cumsum(Omega)) %>%
          dplyr::rename("p-value" = p.value) %>%
          dplyr::rename(Rank = rank) %>%
          dplyr::mutate_if(is.numeric, round, digits = 3)

        kableExtra::kable_styling(
          kable_input = kableExtra::kable(
            x = dplyr::bind_rows(ls_tbl), caption = caption
          ),
          bootstrap_options = "striped", full_width = full_width
        )

      })

      output$tbl_ls_model <- shiny::renderText({
        tbl_ls_model()
      })

      # Linear Approximation Prediction
      tbl_ls_pred <- shiny::reactive({

        approximation <- rumr:::clamp_value(
          x = lsmr:::predict.lsmr(ls_model,x[,traits]),
          interval = c(18, 102)
        )

        ls_tbl <- dplyr::bind_cols(
          Baseline = ls_model$coefficients[1],
          Estimate = estimate,
          Approximation = approximation
        ) %>%
          dplyr::mutate_if(is.numeric,round, digits = 3)

        caption <- "Linear Approximation"

        kableExtra::kable_styling(
          kable_input = kableExtra::kable(
            x = dplyr::bind_rows(ls_tbl), caption = caption, align = "c"
          ),
          bootstrap_options = "striped", full_width = full_width
        )

      })

      output$tbl_ls_pred <- shiny::renderText({
        tbl_ls_pred()
      })

      # Trait Contribution
      tbl_ls_cont <- shiny::reactive({

        rescale <- function(x) {
          sign(x) * (abs(x) / sum(x))
        }

        approximation <- rumr:::clamp_value(
          x = lsmr:::predict.lsmr(ls_model,x[,traits]),
          interval = c(18, 102)
        )

        baseline <- ls_model$coefficients[1]

        ls_tbl <- lsmr:::predict.lsmr(ls_model, x[,traits], type = "table") %>%
          dplyr::arrange(Rank) %>%
          dplyr::rename(Trait = Feature) %>%
          dplyr::rename(Stage = Value) %>%
          dplyr::mutate(
            Contribution = (approximation - baseline) * rescale(Contribution)
          ) %>%
          dplyr::mutate(
            Relative = abs(Contribution) / sum(abs(Contribution))
          ) %>%
          dplyr::mutate(Cumulative = cumsum(Relative)) %>%
          dplyr::mutate_if(is.numeric, round, digits = 3)

        caption <- "Trait Contribution"
        kableExtra::kable_styling(
          kable_input = kableExtra::kable(
            x = dplyr::bind_rows(ls_tbl), caption = caption
          ),
          bootstrap_options = "striped", full_width = full_width
        )

      })

      output$tbl_ls_cont <- shiny::renderText({
        tbl_ls_cont()
      })

    })

    # Report - Download Handler
    output$reportUI <- shiny::renderUI({

      shiny::tagList(
        shiny::br(),
        shiny::br(),
        shiny::br(),
        shiny::br(),
        shiny::fluidRow(
          shiny::downloadButton(
            outputId = "btn_report",
            label = "Report",
            class = "download"
          )
        )
      )
    })

    output$btn_report <- downloadHandler(

      filename = function() {
        name <- paste0("drnnage-report", ".html")
        return(name)
      },

      content = function(file) {

        shiny::withProgress(message = "Generating Report ...", expr = {

          params <- list(
            # Tables
            tbl_pred = tbl_pred(),
            tbl_int = tbl_int(),
            tbl_ls_pred = tbl_ls_pred(),
            tbl_ls_model = tbl_ls_model(),
            tbl_ls_summary = tbl_ls_summary(),
            tbl_ls_cont = tbl_ls_cont(),
            tbl_rma = tbl_rma(),
            # Plots
            plt_tg_rum = plt_tg_rum(),
            plt_accu = plt_accu(),
            plt_bias = plt_bias(),
            plt_effi = plt_effi(),
            # Parameters
            analysis = list(
              algorithm = c(
                "drwnnet" = "Randomized Network",
                "edrwnnet" = "Ensembled Randomized Network",
                "edaerwnnet" = "Ensembled Autoencoder (U)",
                "saerwnnet" = "Ensembled Autoencoder (S)"
              )[input$algorithm],
              alpha = as.numeric(input$alpha),
              seed = input$seed,
              width = as.numeric(input$width),
              depth = as.numeric(input$depth),
              exponent = as.numeric(input$exponent),
              eta = as.numeric(input$eta)
            )
          )

          out <- rmarkdown::render(
            input = 'www/markdown/report/report-template.Rmd',
            params = params
          )

          file.rename(out, file)

        })

      }
    )

  })

})
