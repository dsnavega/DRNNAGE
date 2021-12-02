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
ClavicleRibScoreUI <- function() {

  shiny::tagList(
    shiny::tabsetPanel(type = "pill",

      shiny::tabPanel(title = "Clavicle & 1st Rib Trait Score",
        shiny::hr(),
        shiny::br(),

        shiny::column(width = 3,
          shinyWidgets::panel(heading = "Left Clavicle",
            shinyWidgets::radioGroupButtons(inputId = "CLV01L",
              label = "[CLV01L] Sternal end",
              choices = c("0", "1", "2", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),
            shinyWidgets::radioGroupButtons(inputId = "CLV02L",
              label = "[CLV02L] Acromial end",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),
          ),

          shiny::br(),
          shinyWidgets::panel(heading = "Left 1st Rib",
            shinyWidgets::radioGroupButtons(inputId = "RB101L",
              label = "[RB101L] Costal face",
              choices = c("0", "1", "2", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),
            shinyWidgets::radioGroupButtons(inputId = "RB102L",
              label = "[RB102L] Tubercle",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),
          )
        ),

        shiny::column(width = 3,
          shinyWidgets::panel(heading = "Right Clavicle",
            shinyWidgets::radioGroupButtons(inputId = "CLV01R",
              label = "[CLV01R] Sternal end",
              choices = c("0", "1", "2", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "CLV02R",
              label = "[CLV2R] Acromial end",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),
          ),

          shiny::br(),
          shinyWidgets::panel(heading = "Right 1st Rib",
            shinyWidgets::radioGroupButtons(inputId = "RB101R",
              label = "[RB101R] Costal face",
              choices = c("0", "1", "2", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "RB102R",
              label = "[RB102R] Tubercle",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            )
          )
        )
      ),

      shiny::tabPanel(title = "Trait Scoring System",
        shiny::hr(),

        shiny::column(width = 6,

          shinyWidgets::panel(heading = "Clavicle sternal end",
            shiny::includeMarkdown(path = "www/markdown/score/sternal-score.md")
          ),

          shinyWidgets::panel(heading = "Clavicle acromial end",
            shiny::includeMarkdown(path = "www/markdown/score/acromial-score.md")
          )
        ),

        shiny::column(width = 6,

          shinyWidgets::panel(heading = "First rib costal face",
            shiny::includeMarkdown(path = "www/markdown/score/costal-score.md")
          ),

          shinyWidgets::panel(heading = "First rib tubercle",
            shiny::includeMarkdown(path = "www/markdown/score/tubercle-score.md")
          )
        )
      )

    )
  )
}
