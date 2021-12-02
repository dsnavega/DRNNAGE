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
VertebraeScoreUI <- function() {
  shiny::tagList(
    shiny::tabsetPanel(type = "pill",

      shiny::tabPanel(title = "Vertebrae Trait Score",
        shiny::hr(),
        shiny::br(),

        shiny::fluidRow(
          shiny::column(width = 3,
            shinyWidgets::panel(heading = "Cervical vertebrae [1/2]",
              shinyWidgets::radioGroupButtons(inputId = "C3IS",
                label = "[C3IS] C3 Inferior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              ),

              shinyWidgets::radioGroupButtons(inputId = "C4IS",
                label = "[C4IS] C4 Inferior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              ),

              shinyWidgets::radioGroupButtons(inputId = "C5IS",
                label = "[C5IS] Inferior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              ),

              shinyWidgets::radioGroupButtons(inputId = "C6IS",
                label = "[C6IS] C6 Inferior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              )
            )
          ),

          shiny::column(width = 3,
            shinyWidgets::panel(heading = "Cervical vertebrae [2/2]",
              shinyWidgets::radioGroupButtons(inputId = "C4SS",
                label = "[C4SS] C4 Superior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              ),

              shinyWidgets::radioGroupButtons(inputId = "C5SS",
                label = "[C5SS] C5 Superior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              ),

              shinyWidgets::radioGroupButtons(inputId = "C6SS",
                label = "[C6SS] C6 Superior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              ),

              shinyWidgets::radioGroupButtons(inputId = "C7SS",
                label = "[C7SS] C7 Superior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              )
            )
          ),

          shiny::column(width = 3,
            shinyWidgets::panel(heading = "Lumbar vertebrae [1/2]",
              shinyWidgets::radioGroupButtons(inputId = "L1IS",
                label = "[L1IS] L1 Inferior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              ),

              shinyWidgets::radioGroupButtons(inputId = "L2IS",
                label = "[L2IS] L2 Inferior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              ),

              shinyWidgets::radioGroupButtons(inputId = "L3IS",
                label = "[L3IS] L3 Inferior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              ),

              shinyWidgets::radioGroupButtons(inputId = "L4IS",
                label = "[L4IS] L4 Inferior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              )
            )
          ),

          shiny::column(width = 3,
            shinyWidgets::panel(heading = "Lumbar vertebrae [2/2]",
              shinyWidgets::radioGroupButtons(inputId = "L2SS",
                label = "[L2SS] L2 Superior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              ),

              shinyWidgets::radioGroupButtons(inputId = "L3SS",
                label = "[L3SS] L3 Superior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              ),

              shinyWidgets::radioGroupButtons(inputId = "L4SS",
                label = "[L4SS] L4 Superior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              ),

              shinyWidgets::radioGroupButtons(inputId = "L5SS",
                label = "[L5SS] L5 Superior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              )
            )
          )
        ),

        shiny::fluidRow(
          shiny::br(),
          shiny::column(width = 3,
            shinyWidgets::panel(heading = "Sacrum",
              shinyWidgets::radioGroupButtons(inputId = "S1SS",
                label = "[S1SS] S1 Superior Surface",
                choices = c("0", "1", "2", NA),
                selected = NA,
                size = "sm",
                justified =  T
              ),

              shinyWidgets::radioGroupButtons(inputId = "S1S2F",
                label = "[S1S2F] S1-S2 Fusion",
                choices = c("0", "1", NA),
                selected = NA,
                size = "sm",
                justified =  T
              )
            )
          )
        )

      ),

      shiny::tabPanel(title = "Trait Scoring System",
        shiny::hr(),
        shiny::column(width = 6,
          shinyWidgets::panel(heading = "Vertebral Body Surfaces",
            shiny::includeMarkdown(path = "www/markdown/score/vertebra-score.md")
          )
        ),
        shiny::column(width = 6,
          shinyWidgets::panel(heading = "S1-S2 Fusion",
            shiny::includeMarkdown(path = "www/markdown/score/fusion-score.md")
          )
        )
      )
    )
  )
}
