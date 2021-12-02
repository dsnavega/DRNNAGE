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
AcetabulumScoreUI <- function() {

  shiny::tagList(
    shiny::tabsetPanel(type = "pill",

      shiny::tabPanel(title = "Acetabulum Trait Score",
        shiny::hr(),
        shiny::br(),

        shiny::column(width = 3,
          shinyWidgets::panel(heading = "Left acetabulum",
            shinyWidgets::radioGroupButtons(inputId = "ACT01L",
              label = "[ACT01L] Acetabular rim",
              choices = c("0", "1", "2", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "ACT02L",
              label = "[ACT02L] Posterior horn",
              choices = c("0", "1", "2", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "ACT03L",
              label = "[ACT03L] Acetabular fossa",
              choices = c("0", "1", "2", NA),
              selected = NA,
              size = "sm",
              justified =  T
            )
          )
        ),

        shiny::column(width = 3,
          shinyWidgets::panel(heading = "Right acetabulum",
            shinyWidgets::radioGroupButtons(inputId = "ACT01R",
              label = "[ACT01R] Acetabular rim",
              choices = c("0", "1", "2", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "ACT02R",
              label = "[ACT02R] Posterior horn",
              choices = c("0", "1", "2", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "ACT03R",
              label = "[ACT03R] Acetabular fossa",
              choices = c("0", "1", "2", NA),
              selected = NA,
              size = "sm",
              justified =  T
            )
          )
        )

      ),

      shiny::tabPanel(title = "Trait Scoring System",
        shiny::hr(),

        shiny::column(width = 4,
          shinyWidgets::panel(heading = "Acetabular rim",
            shiny::includeMarkdown(path = "www/markdown/score/act-rim-score.md")
          )
        ),

        shiny::column(width = 4,
          shinyWidgets::panel(heading = "Posterior horn",
            shiny::includeMarkdown(path = "www/markdown/score/act-horn-score.md")
          )
        ),

        shiny::column(width = 4,
          shinyWidgets::panel(heading = "Acetabular fossa",
            shiny::includeMarkdown(path = "www/markdown/score/act-fossa-score.md")
          )
        )
      )
    )
  )

}
