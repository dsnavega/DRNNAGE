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
UpperLimbScoreUI <- function() {

  shiny::tagList(
    shiny::tabsetPanel(type = "pill",

      shiny::tabPanel(title = "Upper Limb Trait Score",
        shiny::hr(),
        shiny::br(),

        shiny::column(width = 3,
          shinyWidgets::panel(heading = "Left scapula and humerus",
            shinyWidgets::radioGroupButtons(inputId = "SC01L",
              label = "[SC01L] Scapula glenoid fossa ",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "HM01L",
              label = "[HM01L] Humerus head ",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "HM02L",
              label = "[HM02L] Humerus lesser tubercle",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "HM03L",
              label = "[HM03L] Humerus greater tubercle",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "HM04L",
              label = "[HM04L] Humerus capitulum & trochlea",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "HM05L",
              label = "[HM05L] Humerus medial epicondyle",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "HM06L",
              label = "[HM06L] Humerus lateral epicondyle",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            )
          )
        ),

        shiny::column(width = 3,
          shinyWidgets::panel(heading = "Right scapula and humerus",
            shinyWidgets::radioGroupButtons(inputId = "SC01R",
              label = "[SC01R] Scapula glenoid fossa",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "HM01R",
              label = "[HM01R] Humerus head",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "HM02R",
              label = "[HM02R] Humerus lesser tubercle",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "HM03R",
              label = "[HM03R] Humerus greater tubercle",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "HM04R",
              label = "[HM04R] Humerus capitulum & trochlea",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "HM05R",
              label = "[HM05R] Humerus medial epicondyle",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "HM06R",
              label = "[HM06R] Humerus lateral epicondyle",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            )
          )
        ),

        column(width = 3,
          shinyWidgets::panel(heading = "Left ulna and radius",
            shinyWidgets::radioGroupButtons(inputId = "UL01L",
              label = "[UL01L] Ulna prox. articular facet ",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "UL02L",
              label = "[UL02L] Ulna olecranon",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),
            shiny::hr(),

            shinyWidgets::radioGroupButtons(inputId = "RD01L",
              label = "[RD01L] Radius head",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "RD02L",
              label = "[RD02L] Radius tuberosity",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            )
          )
        ),

        shiny::column(width = 3,
          shinyWidgets::panel(heading = "Right ulna and radius",
            shinyWidgets::radioGroupButtons(inputId = "UL01R",
              label = "[UL01R] Ulna prox. articular facet",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "UL02R",
              label = "[UL02R] Ulna olecranon",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shiny::hr(),
            shinyWidgets::radioGroupButtons(inputId = "RD01R",
              label = "[RD01R] Radius head",
              choices = c("0", "1", NA),
              selected = NA,
              size = "sm",
              justified =  T
            ),

            shinyWidgets::radioGroupButtons(inputId = "RD02R",
              label = "[RD02R] Radius tuberosity",
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
            shiny::includeMarkdown(path = "www/markdown/score/upper-score.md")
          )
        )
      )
    )
  )

}
