#' Creates the MRCA priors' XML for the tracelog section
#'
#' Creates the MRCA priors' XML for the tracelog section.
#'
#' \code{
#'   <logger id="tracelog" ...>
#'    # Here
#'   </logger>
#' }
#' @inheritParams default_params_doc
#' @return lines of XML text
#' @seealso the complete tracelog section is created
#'   by \code{\link{create_tracelog_xml}}
#' @author Richèl J.C. Bilderbeek
#' @export
mrca_priors_to_xml_tracelog <- function(
  clock_models,
  mrca_priors,
  tipdates_filename = NA
) {
  testit::assert(beautier::are_mrca_priors(mrca_priors))
  text <- NULL

  for (mrca_prior in mrca_priors) {
    text <- c(text,
      beautier::mrca_prior_to_xml_tracelog(
        clock_models = clock_models,
        mrca_prior = mrca_prior,
        tipdates_filename = tipdates_filename
      )
    )
  }
  text
}
