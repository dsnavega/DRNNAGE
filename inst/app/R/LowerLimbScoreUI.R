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
LowerLimbScoreUI <- function() {

  shiny::tagList(
    shiny::tabsetPanel(type = "pill",

      shiny::tabPanel(title = "Lower Limb Trait Score",
        shiny::hr(),
        shiny::br(),

        shiny::column(width = 3,
          shinyWidgets::panel(heading = "Left os coxa and femur",
            shinyWidgets::radioGroupButtons(inputId = "OC01L",
              label = "[OC01L] Os coxa iliac tuberosity",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "OC02L",
              label = "[OC02L] Os coxa ischial tuberosity",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "OC03L",
              label = "[OC03L] Os coxa acetabulum",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "FM01L",
              label = "[FM01L] Femur head",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "FM02L",
              label = "[FM02L] Femur trochanteric fossa",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "FM03L",
              label = "[FM03L] Femur greater throcanter",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "FM04L",
              label = "[FM04L] Femur lesser throcanter",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "FM05L",
              label = "[FM05L] Femur condyles",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            )
          )
        ),

        shiny::column(width = 3,
          shinyWidgets::panel(heading = "Right os coxa and femur",
            shinyWidgets::radioGroupButtons(inputId = "OC01R",
              label = "[OC01R] Os coxa iliac tuberosity",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "OC02R",
              label = "[OC02R] Os coxa ischial tuberosity",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "OC03R",
              label = "[OC03R] Os coxa acetabulum",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "FM01R",
              label = "[FM01R] Femur head",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "FM02R",
              label = "[FM02R] Femur trochanteric fossa",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "FM03R",
              label = "[FM03R] Femur greater throcanter",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "FM04R",
              label = "[FM04R] Femur lesser throcanter",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "FM05R",
              label = "[FM05R] Femur condyles",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            )
          )
        ),

        shiny::column(width = 3,
          shinyWidgets::panel(heading = "Left tibia, pattela & calcaneus",
            shinyWidgets::radioGroupButtons(inputId = "TB01L",
              label = "[TB01L] Tibia condyles",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "PT01L",
              label = "[PT01L] Patella articular surface",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "PT02L",
              label = "[PT02L] Patella base",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "CLN01L",
              label = "[CLN01L] Calcaneus tuberosity",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            )
          )
        ),

        shiny::column(width = 3,
          shinyWidgets::panel(heading = "Right tibia, pattela & calcaneus",
            shinyWidgets::radioGroupButtons(inputId = "TB01R",
              label = "[TB01R] Tibia condyles",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "PT01R",
              label = "[PT01R] Patella articular surface",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "PT02R",
              label = "[PT02R] Patella base",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "CLN01R",
              label = "[CLN01R] Calcaneus tuberosity",
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
          shinyWidgets::panel(heading = "Generic Joint Degeneration",
            shiny::includeMarkdown(path = "www/markdown/score/joint-score.md")
          ),

          shinyWidgets::panel(heading = "Generic Musculoskeletal Degeneration",
            shiny::includeMarkdown(path = "www/markdown/score/musculoskeletal-score.md")
          )
        ),
        shiny::column(width = 6,
          shinyWidgets::panel(heading = "Trait specific Stage 1 Description",
            shiny::includeMarkdown(path = "www/markdown/score/lower-score.md")
          )
        )
      )
    )
  )

}
