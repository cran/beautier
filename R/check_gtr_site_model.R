#' Check if the \code{gtr_site_model} is a valid
#' GTR nucleotide substitution model.
#'
#' Use \link{create_gtr_site_model} to create a valid
#' GTR nucleotide substitution model.
#' @inheritParams default_params_doc
#' @return TRUE is the \code{gtr_site_model} is a valid
#' GTR nucleotide substitution model, FALSE otherwise
#' @examples
#' check_empty_beautier_folder()
#'
#' check_gtr_site_model(create_gtr_site_model())
#'
#' check_empty_beautier_folder()
#' @export
check_gtr_site_model <- function(gtr_site_model) {
  check_site_model(gtr_site_model)
  if (gtr_site_model$name != "GTR") {
    stop("'gtr_site_model$name' must be 'GTR'")
  }
  check_gtr_site_model_names(gtr_site_model)

  # Check if all distributions are valid distributions
  expected_distrs <- list(
    gtr_site_model$rate_ac_prior_distr,
    gtr_site_model$rate_ag_prior_distr,
    gtr_site_model$rate_at_prior_distr,
    gtr_site_model$rate_cg_prior_distr,
    gtr_site_model$rate_gt_prior_distr
  )
  for (expected_distr in expected_distrs) {
    if (!is_distr(expected_distr)) {
      stop("Invalid gtr_site_model$distr")
    }
  }

  # Check if all parameters are valid parameters
  expected_params <- list(
    gtr_site_model$rate_ac_param,
    gtr_site_model$rate_ag_param,
    gtr_site_model$rate_at_param,
    gtr_site_model$rate_cg_param,
    gtr_site_model$rate_ct_param,
    gtr_site_model$rate_gt_param
  )
  for (expected_param in expected_params) {
    if (!is_param(expected_param)) {
      stop("Invalid gtr_site_model$param")
    }
  }

  if (!is_freq_equilibrium_name(gtr_site_model$freq_equilibrium)) {
    stop("Invalid gtr_site_model$freq_equilibrium")
  }
  TRUE

}

#' Check if the \code{gtr_site_model} has the list elements
#' of a valid \code{gtr_site_model} object.
#'
#' Calls \code{stop} if an element is missing
#' @inheritParams default_params_doc
#' @return nothing
#' @seealso Use \link{create_gtr_site_model}
#' to create a valid \code{gtr_site_model}
#' @author Richèl J.C. Bilderbeek
#' @export
check_gtr_site_model_names <- function(gtr_site_model) {

  list_element_names <- c(
    "rate_ac_prior_distr",
    "rate_ag_prior_distr",
    "rate_at_prior_distr",
    "rate_cg_prior_distr",
    "rate_gt_prior_distr",
    "rate_ac_param",
    "rate_ag_param",
    "rate_at_param",
    "rate_cg_param",
    "rate_ct_param",
    "rate_gt_param",
    "freq_equilibrium",
    "freq_param"
  )
  for (arg_name in list_element_names) {
    if (!arg_name %in% names(gtr_site_model)) {
      stop(
        "'", arg_name, "' must be an element of an 'gtr_site_model'. \n",
        "Tip: use 'create_gtr_site_model'"
      )
    }
  }
}
