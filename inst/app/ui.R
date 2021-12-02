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
ui <- shiny::tagList(
  tags$style(type="text/css", "body {padding-top: 70px;}"),
  shiny::navbarPage(title = "DRNNAGE", position = "fixed-top",
    theme = shinythemes::shinytheme(theme = "sandstone"),

    shiny::navbarMenu(title = "About",
      shiny::tabPanel(title = "License",
        shiny::column(width = 6, offset = 3,
          shiny::br(),
          shiny::br(),
          shiny::br(),
          shiny::br(),
          shinyWidgets::panel(
            heading = "License",
            footer = "(C) 2021 David Senhora Navega",
            shiny::includeMarkdown("www/markdown/license.md")
          )
        )
      )
    ),

    shiny::tabPanel(title = "Morphoscopic Analysis",
      shiny::br(),
      shiny::navlistPanel(widths = c(2, 10), well = F,

        shiny::tabPanel(title = "Sutures",
          SutureScoreUI()
        ),

        shiny::tabPanel(title = "Vertebrae",
          VertebraeScoreUI()
        ),

        shiny::tabPanel(title = "Upper Limb",
          UpperLimbScoreUI()
        ),

        shiny::tabPanel(title = "Lower Limb",
          LowerLimbScoreUI()
        ),

        shiny::tabPanel(title = "Clavicle & 1st Rib",
          ClavicleRibScoreUI()
        ),

        shiny::tabPanel(title = "Pubic Symphysis",
          PubicSymphysisScoreUI()
        ),

        shiny::tabPanel(title = "Sacroiliac Joint",
          SacroIliacJointScoreUI()
        ),

        shiny::tabPanel(title = "Acetabulum",
          AcetabulumScoreUI()
        )

      )
    ),

    tabPanel(title = "Computational Analysis",
      shiny::br(),
      shiny::sidebarLayout(

        shiny::sidebarPanel(width = 3,
          ParametersUI()
        ),

        shiny::mainPanel(

          shiny::tabsetPanel(type = "pills",

            shiny::tabPanel(title = "Estimate",
              shiny::hr(),
              shiny::column(width = 4,
                shiny::br(),
                shiny::tableOutput("tbl_pred"),
                shiny::br(),
                shiny::tableOutput("tbl_int")
              ),
              shiny::column(width = 7, offset = 1,
                shiny::br(),
                shiny::plotOutput("plt_tg_rum")
              )
            ),

            shiny::tabPanel(title = "Model Assessment",
              shiny::hr(),
              shiny::fluidRow(
                shiny::column(width = 12, shiny::tableOutput("tbl_rma"))
              ),
              shiny::br(),
              shiny::fluidRow(
                column(width = 6, shiny::plotOutput("plt_bias")),
                column(width = 6, shiny::plotOutput("plt_effi"))
              )
            )
          )
        )
      )
    )
  )
)
