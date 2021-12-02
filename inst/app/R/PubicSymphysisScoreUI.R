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
PubicSymphysisScoreUI <- function() {

  shiny::tagList(
    shiny::tabsetPanel(type = "pill",

      shiny::tabPanel(title = "Pubic Symphysis Trait Score",
        shiny::hr(),
        shiny::br(),

        shiny::column(width = 3,
          shinyWidgets::panel(heading = "Left pubic symphysis",
            shinyWidgets::radioGroupButtons(inputId = "PSY01L",
              label = "[PSY01L] Symphyseal rim",
              choices = c("0", "1", "2", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "PSY02L",
              label = "[PSY02L] Symphyseal topography",
              choices = c("0", "1", "2", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "PSY03L",
              label = "[PSY03L] Symphyseal texture",
              choices = c("0", "1", "2", NA),
              selected = NA,
              size = "sm",
              justified =  T
            )
          )
        ),

        shiny::column(width = 3,
          shinyWidgets::panel(heading = "Right pubic symphysis",
            shinyWidgets::radioGroupButtons(inputId = "PSY01R",
              label = "[PSY01R] Symphyseal rim",
              choices = c("0", "1", "2", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "PSY02R",
              label = "[PSY02R] Symphyseal topography",
              choices = c("0", "1", "2", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "PSY03R",
              label = "[PSY03R] Symphyseal texture",
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
          shinyWidgets::panel(heading = "Symphyseal rim",
            shiny::includeMarkdown(path = "www/markdown/score/ps-rim-score.md")
          )
        ),

        shiny::column(width = 4,
          shinyWidgets::panel(heading = "Symphyseal topography",
            shiny::includeMarkdown(path = "www/markdown/score/ps-tpg-score.md")
          )
        ),

        shiny::column(width = 4,
          shinyWidgets::panel(heading = "Pubic symphyseal texture",
            shiny::includeMarkdown(path = "www/markdown/score/ps-txt-score.md")
          )
        )
      )

    )
  )
}
