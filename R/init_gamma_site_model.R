#' Initializes a gamma site model
#' @inheritParams default_params_doc
#' @param distr_id the first distributions' ID
#' @param param_id the first parameter's ID
#' @return an initialized gamma site model
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_empty_beautier_folder()
#'
#' gamma_site_model <- create_gamma_site_model(
#'   gamma_cat_count = 2,
#'   gamma_shape_prior_distr = create_one_div_x_distr(id = NA)
#' )
#' # FALSE: not yet initialized
#' is_init_gamma_site_model(gamma_site_model)
#' gamma_site_model <- init_gamma_site_model(gamma_site_model)
#' # TRUE: now it is initialized
#' is_init_gamma_site_model(gamma_site_model)
#'
#' check_empty_beautier_folder()
#' @export
init_gamma_site_model <- function(
  gamma_site_model,
  distr_id = 0,
  param_id = 0
) {
  check_true(is_gamma_site_model(gamma_site_model))

  if (!is_init_distr(gamma_site_model$gamma_shape_prior_distr)) {
    gamma_site_model$gamma_shape_prior_distr <- init_distr(
      gamma_site_model$gamma_shape_prior_distr,
      distr_id = distr_id,
      param_id = param_id
    )
    distr_id <- distr_id + 1
    param_id <- param_id + get_distr_n_params(
      gamma_site_model$gamma_shape_prior_distr
    )
  }
  check_true(is_gamma_site_model(gamma_site_model))
  gamma_site_model
}
