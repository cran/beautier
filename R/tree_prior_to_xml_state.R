#' Creates the XML of a tree prior,
#'   as used in the \code{state} section
#' @inheritParams default_params_doc
#' @return the tree prior as XML text
#' @author Richèl J.C. Bilderbeek
#' @export
tree_prior_to_xml_state <- function(
  inference_model,
  tree_prior = "deprecated"
) {
  if (tree_prior != "deprecated") {
    stop("'tree_prior' is deprecated, use 'inference_model' instead")
  }
  # Do not be smart yet
  tree_prior <- inference_model$tree_prior

  testit::assert(beautier::is_tree_prior(tree_prior))
  id <- tree_prior$id
  testit::assert(beautier::is_id(id))

  text <- NULL
  if (beautier::is_bd_tree_prior(tree_prior)) {
    text <- c(text, paste0("<parameter id=\"BDBirthRate.t:", id, "\" ",
      "lower=\"0.0\" name=\"stateNode\" upper=\"10000.0\">1.0</parameter>"))
    text <- c(text, paste0("<parameter id=\"BDDeathRate.t:", id, "\" ",
      "lower=\"0.0\" name=\"stateNode\" upper=\"1.0\">0.5</parameter>"))
  } else if (beautier::is_ccp_tree_prior(tree_prior)) {
    text <- c(text, beautier::ccp_tree_prior_to_xml_state(inference_model))
  } else if (beautier::is_cbs_tree_prior(tree_prior)) {
    text <- c(text, paste0("<parameter id=\"bPopSizes.t:", id, "\" ",
      "dimension=\"5\" lower=\"0.0\" name=\"stateNode\" ",
      "upper=\"380000.0\">380.0</parameter>"))
    text <- c(
      text,
      paste0(
        "<stateNode id=\"bGroupSizes.t:", id, "\" ",
        "spec=\"parameter.IntegerParameter\" ",
        "dimension=\"", tree_prior$group_sizes_dimension, "\">1</stateNode>"
      )
    )
  } else if (beautier::is_cep_tree_prior(tree_prior)) {
    text <- c(text, paste0("<parameter id=\"ePopSize.t:", id, "\" ",
      "name=\"stateNode\">0.3</parameter>"))
    text <- c(text, paste0("<parameter id=\"growthRate.t:", id, "\" ",
      "name=\"stateNode\">3.0E-4</parameter>"))
  } else {
    testit::assert(beautier::is_yule_tree_prior(tree_prior))
    parameter_xml <- paste0(
      "<parameter ", "id=\"birthRate.t:", id, "\" "
    )
    if (inference_model$beauti_options$beast2_version == "2.6") {
      parameter_xml <- paste0(
        parameter_xml, "spec=\"parameter.RealParameter\" "
      )
    }
    parameter_xml <- paste0(
      parameter_xml, "name=\"stateNode\">1.0</parameter>"
    )
    text <- parameter_xml
  }
  text
}
