#' Create a BEAST2 XML input text
#' @inheritParams default_params_doc
#' @return a character vector of XML strings
#' @seealso
#'   Use \link{create_beast2_input_from_model} to create the BEAST2 XML
#'   input text from an inference model
#'   Use \link{create_beast2_input_file} to also save it to file.
#' @examples
#' if (is_on_ci()) {
#'   create_beast2_input(
#'     input_filename = get_fasta_filename()
#'   )
#' }
#' @seealso \code{\link{create_beast2_input_file}} shows more examples
#' @author Richèl J.C. Bilderbeek
#' @export
create_beast2_input <- function(
  input_filename,
  tipdates_filename = NA,
  site_model = create_jc69_site_model(),
  clock_model = create_strict_clock_model(),
  tree_prior = create_yule_tree_prior(),
  mrca_prior = NA,
  mcmc = create_mcmc(),
  beauti_options = create_beauti_options()
) {
  inference_model <- create_inference_model(
    site_model = site_model,
    clock_model = clock_model,
    tree_prior = tree_prior,
    mrca_prior = mrca_prior,
    mcmc = mcmc,
    beauti_options = beauti_options,
    tipdates_filename = tipdates_filename
  )
  create_beast2_input_from_model(
    input_filename = input_filename,
    inference_model = inference_model
  )
}
