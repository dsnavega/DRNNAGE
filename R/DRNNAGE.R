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
