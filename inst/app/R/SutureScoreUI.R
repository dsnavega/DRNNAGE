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
SutureScoreUI <- function() {
  shiny::tagList(
    shiny::tabsetPanel(type = "pill",

      shiny::tabPanel(title = "suture Trait Score",
        shiny::hr(),
        shiny::br(),

        shiny::column(width = 4,
          shinyWidgets::panel(heading = "Palatine",
            shinyWidgets::radioGroupButtons(inputId = "CRS01",
              label = "[CRS01] Palatine (Posterior, Median)",
              choices = c("0", "1", NA),
              select = NA,
              size = "sm",
              justified =  T
            ),
            shinyWidgets::radioGroupButtons(inputId = "CRS02L",
              label = "[CRS02L] Palatine (Transverse, L)",
              choices = c("0", "1", NA),
              select = NA,
              size = "sm",
              justified =  T
            ),
            shinyWidgets::radioGroupButtons(inputId = "CRS02R",
              label = "[CRS02R] Palatine (Transverse, R)",
              choices = c("0", "1", NA),
              select = NA,
              size = "sm",
              justified =  T
            )
          )
        ),

        shiny::column(width = 4,
          shinyWidgets::panel(heading = "Coronal - Sagittal",
            shinyWidgets::radioGroupButtons(inputId = "CRS03",
              label = "[CRS03] Coronal-Sagittal (pars bregmatica)",
              choices = c("0", "1", NA),
              select = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "CRS04L",
              label = "[CRS04L] Coronal (pars pterica, L)",
              choices = c("0", "1", NA),
              select = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "CRS04R",
              label = "[CRS04R] Coronal (pars pterica, R)",
              choices = c("0", "1", NA),
              select = NA,
              size = "sm",
              justified =  T
            )
          )
        ),

        shiny::column(width = 4,
          shinyWidgets::panel(heading = "Lamboid - Sagittal",
            shinyWidgets::radioGroupButtons(inputId = "CRS05",
              label = "[CRS05] Sagittal-Lambdoid (pars lambdica)",
              choices = c("0", "1", NA),
              select = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "CRS06L",
              label = "[CRS06L] Lamboid (pars asterica, L)",
              choices = c("0", "1", NA),
              select = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "CRS06R",
              label = "[CRS06R] Lambdoid (pars asterica, R)",
              choices = c("0", "1", NA),
              select = NA,
              size = "sm",
              justified =  T
            )
          )
        )
      ),

      shiny::tabPanel(title = "Trait Scoring System",
        shiny::hr(),
        shiny::column(width = 6,
          shinyWidgets::panel(heading = "Suture Segments",
            shiny::includeMarkdown(path = "www/markdown/score/suture-score.md")
          )
        ),
      )
    )
  )
}
