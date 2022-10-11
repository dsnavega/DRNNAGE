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
ParametersUI <- function() {

  shiny::tagList(

    shiny::selectInput(
      inputId = "algorithm",
      label = "Network Algorithm",
      choices = c(
        # Deep Fully Randomized Network (ELM or RVFL)
        "Deep Fully Randomized Network" = "drwnnet",
        # Stacked Auto-encoding Network (Shallow/Deep+)
        "Stacked Randomized Autoencoder" = "aerwnnet",
        # Ensemble Deep Fully Randomized Network (RVFL)
        "Ensemble Deep Fully Randomized Network" = "edrwnnet",
        # Supervised Auto-encoding Network
        "Supervised Randomized Autoencoder" = "saerwnnet"
      ),
      selected = "edrwnnet"
    ),

    shiny::sliderInput(
      inputId = "width",
      label = "Layer Size",
      value = 32,
      min = 8,
      max = 256,
      step = 8
    ),

    shiny::sliderInput(
      inputId = "depth",
      label = "Network Depth",
      value = 8,
      min = 2,
      max = 16,
      step = 1
    ),

    shiny::sliderInput(
      inputId = "eta",
      label = "Gaussian Noise",
      value = 1.00,
      min = 0.00,
      max = 2.57,
      step = 0.01
    ),

    shiny::sliderInput(
      inputId = "alpha",
      label = "Uncertainty Level (alpha)",
      value = 0.1,
      min = 0.01,
      max = 0.5,
      step = 0.01
    ),

    shiny::sliderInput(
      inputId = "exponent",
      label = "Variance Model Exponent",
      value = 1,
      min = 0.01,
      max = 2,
      step = 0.01
    ),

    shiny::numericInput(
      inputId = "seed",
      label = "RNG Seed",
      value = 99676,
      min = 0,
      max = 99999,
      step = 1
    ),

    shiny::actionButton(
      inputId = "btn_analyze",
      label = "Analyze",
      width = "100%"
    )

  )

}
