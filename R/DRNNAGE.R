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
#
#' DRNNAGE
#'
#' Run DRNNAGE GUI
#'
#' @export
#'
#' @usage
#' DRNNAGE()
#'
DRNNAGE <- function() {

  drnnage_dir <- system.file("app", package = "DRNNAGE", mustWork = T)
  drnnage_app <- shiny::shinyAppDir(appDir = drnnage_dir)
  shiny::runApp(
    appDir = drnnage_app,
    quiet = TRUE
  )

}
