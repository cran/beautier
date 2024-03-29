#' Creates the site models' XML for the tracelog section
#' @inheritParams default_params_doc
#' @return lines of XML text
#' @seealso the complete tracelog section is created
#'   by \code{\link{create_tracelog_xml}}
#' @examples
#' check_empty_beautier_folder()
#'
#' # <logger id="tracelog" ...>
#' #'   # Here
#' # </logger>
#'
#' check_empty_beautier_folder()
#' @author Richèl J.C. Bilderbeek
#' @export
site_models_to_xml_tracelog <- function(
  site_models
) {
  text <- NULL
  for (site_model in site_models) {
    text <- c(text, site_model_to_xml_tracelog(site_model))
  }
  text
}
