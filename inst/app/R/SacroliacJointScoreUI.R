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

#' @author David Senhora "NA"vega
#'
SacroIliacJointScoreUI <- function() {

  shiny::tagList(
    shiny::tabsetPanel(type = "pill",

      shiny::tabPanel(title = "Sacroiliac Joint Trait Score",
        shiny::hr(),
        shiny::br(),

        shiny::column(width = 3,
          shinyWidgets::panel(heading = "Left iliac surface",
            shinyWidgets::radioGroupButtons(inputId = "IAS01L",
              label = "[IAS01L] Surface texture",
              choices = c("0", "1", "2", "NA"),
              selected = "NA",
              size = "sm",
              justified =  T
            ),
            shinyWidgets::radioGroupButtons(inputId = "IAS02L",
              label = "[IAS02L] Surface margin",
              choices = c("0", "1", "NA"),
              selected = "NA",
              size = "sm",
              justified =  T
            ),
          ),

          shiny::br(),
          shinyWidgets::panel(heading = "Left sacral surface",
            shinyWidgets::radioGroupButtons(inputId = "SAS01L",
              label = "[SAS01L] Surface texture",
              choices = c("0", "1", "NA"),
              selected = "NA",
              size = "sm",
              justified =  T
            ),
            shinyWidgets::radioGroupButtons(inputId = "SAS02L",
              label = "[SAS02L] Surface margin",
              choices = c("0", "1", "NA"),
              selected = "NA",
              size = "sm",
              justified =  T
            ),
          )
        ),

        shiny::column(width = 3,
          shinyWidgets::panel(heading = "Right iliac surface",
            shinyWidgets::radioGroupButtons(inputId = "IAS01R",
              label = "[IAS01R] Surface texture",
              choices = c("0", "1", "2", "NA"),
              selected = "NA",
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "IAS02R",
              label = "[IAS02R] Surface margin",
              choices = c("0", "1", "NA"),
              selected = "NA",
              size = "sm",
              justified =  T
            ),
          ),

          shiny::br(),
          shinyWidgets::panel(heading = "Right sacral surface",
            shinyWidgets::radioGroupButtons(inputId = "SAS01R",
              label = "[SAS01R] Surface texture",
              choices = c("0", "1", "NA"),
              selected = "NA",
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "SAS02R",
              label = "[SAS02R] Surface margin",
              choices = c("0", "1", "NA"),
              selected = "NA",
              size = "sm",
              justified =  T
            ),
          )
        )
      ),

      shiny::tabPanel(title = "Trait Scoring System",
        shiny::hr(),

        shiny::column(width = 6,

          shinyWidgets::panel(heading = "Iliac auricular surface texture",
            shiny::includeMarkdown(path = "www/markdown/score/ias-txt-score.md")
          ),

          shinyWidgets::panel(heading = "Iliac auricular surface margin",
            shiny::includeMarkdown(path = "www/markdown/score/ias-mg-score.md")
          )

        ),

        shiny::column(width = 6,

          shinyWidgets::panel(heading = "Sacral auricular surface texture",
            shiny::includeMarkdown(path = "www/markdown/score/sas-txt-score.md")
          ),

          shinyWidgets::panel(heading = "Sacral auricular surface margin",
            shiny::includeMarkdown(path = "www/markdown/score/sas-mg-score.md")
          )

        )
      )

    )
  )

}
