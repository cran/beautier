#' General function to create a site model.
#' @param name the site model name. Valid
#'   names can be found in \code{get_site_model_names}
#' @param id the IDs of the alignment (can be extracted from
#'   the FASTA filename using \code{\link{get_alignment_id}})
#' @param gamma_site_model a gamma site model, as created
#'   by \link{create_gamma_site_model}
#' @param ... specific site model parameters
#' @note Prefer using the
#'   named functions
#'   \code{\link{create_gtr_site_model}},
#'   \code{\link{create_hky_site_model}},,
#'   \code{\link{create_jc69_site_model}},
#'   and \code{\link{create_tn93_site_model}}
#' @seealso See \code{\link{create_gtr_site_model}} for more examples
#'   with a GTR site model. See \code{\link{create_hky_site_model}}
#'   for more examples with an HKY site model. See
#'   \code{\link{create_jc69_site_model}} for more examples with a JC69
#'   site model. See \code{\link{create_tn93_site_model}} for more
#'   examples with a TN93 site model
#' @return a site_model
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_on_ci()) {
#'
#'   check_empty_beautier_folder()
#'
#'   input_filename <- get_fasta_filename()
#'   gtr_site_model <- create_gtr_site_model()
#'   hk_site_model <- create_hky_site_model()
#'   jc69_site_model <- create_jc69_site_model()
#'   tn93_site_model <- create_tn93_site_model()
#'
#'   # Can use any site model
#'   output_filename <- get_beautier_tempfilename()
#'   create_beast2_input_file(
#'     input_filename = input_filename,
#'     output_filename = output_filename,
#'     site_model = jc69_site_model
#'   )
#'   file.remove(output_filename)
#'
#'   remove_beautier_folder()
#'   check_empty_beautier_folder()
#' }
#' @export
create_site_model <- function(
  name,
  id,
  gamma_site_model = create_gamma_site_model(),
  ...
) {
  if (!is_site_model_name(name)) {
    site_models_as_string <- function() {
      s <- NULL
      for (p in get_site_model_names()) {
        s <- paste0(s, ", ", p)
      }
      s <- substr(s, start = 3, stop = nchar(s))
      s
    }
    stop(
      "'site model' must be a site model name, which is one of these: ",
      site_models_as_string()
    )
  }
  check_gamma_site_model(gamma_site_model)
  site_model <- list(
    name = name,
    id = id,
    gamma_site_model = gamma_site_model,
    ...
  )
  site_model
}

#' Create a GTR site model
#' @inheritParams create_site_model
#' @param rate_ac_prior_distr the AC rate prior distribution,
#'   as returned by \code{\link{create_distr}}
#' @param rate_ag_prior_distr the AG rate prior distribution,
#'   as returned by \code{\link{create_distr}}
#' @param rate_at_prior_distr the AT rate prior distribution,
#'   as returned by \code{\link{create_distr}}
#' @param rate_cg_prior_distr the CG rate prior distribution,
#'   as returned by \code{\link{create_distr}}
#' @param rate_gt_prior_distr the GT rate prior distribution,
#'   as returned by \code{\link{create_distr}}
#' @param rate_ac_param the 'rate AC' parameter,
#'   a numeric value.
#'   For advanced usage, use the structure
#'   as returned by \code{\link{create_rate_ac_param}}
#' @param rate_ag_param the 'rate AG' parameter,
#'   a numeric value.
#'   For advanced usage, use the structure
#'   as returned by \code{\link{create_rate_ag_param}}
#' @param rate_at_param the 'rate AT' parameter,
#'   a numeric value.
#'   For advanced usage, use the structure
#'   as returned by \code{\link{create_rate_at_param}}
#' @param rate_cg_param the 'rate CG' parameter,
#'   a numeric value.
#'   For advanced usage, use the structure
#'   as returned by \code{\link{create_rate_cg_param}}
#' @param rate_ct_param the 'rate CT' parameter,
#'   a numeric value.
#'   For advanced usage, use the structure
#'   as returned by \code{\link{create_rate_ct_param}}
#' @param rate_gt_param the 'rate GT' parameter,
#' a numeric value.
#' For advanced usage, use the structure
#' as returned by \code{\link{create_rate_gt_param}}
#' @param freq_equilibrium the frequency in which the rates are at equilibrium
#'   are either \code{estimated}, \code{empirical} or \code{all_equal}.
#'   \code{get_freq_equilibrium_names} returns the possible values
#'   for \code{freq_equilibrium}
#' @param freq_param a `freq` parameter,
#' as created by \link{create_freq_param}
#' @return a GTR site_model
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_on_ci()) {
#'
#'   gtr_site_model <- create_gtr_site_model(
#'     rate_ac_param = 1.2,
#'     rate_ag_param = 2.3,
#'     rate_at_param = 3.4,
#'     rate_cg_param = 4.5,
#'     rate_ct_param = 5.6,
#'     rate_gt_param = 6.7
#'   )
#'
#'   beast2_input_file <- get_beautier_tempfilename()
#'   create_beast2_input_file(
#'     input_filename = get_fasta_filename(),
#'     beast2_input_file,
#'     site_model = gtr_site_model
#'   )
#'   file.remove(beast2_input_file)
#'
#'   remove_beautier_folder()
#' }
#' @aliases create_gtr_site_model create_site_model_gtr
#' @export create_gtr_site_model create_site_model_gtr
create_gtr_site_model <- create_site_model_gtr <- function(
  id = NA,
  gamma_site_model = create_gamma_site_model(),
  rate_ac_prior_distr = create_gamma_distr(
    alpha = 0.05,
    beta = create_beta_param(value = "10.0")
  ),
  rate_ag_prior_distr = create_gamma_distr(
    alpha = 0.05,
    beta = create_beta_param(value = "20.0")
  ),
  rate_at_prior_distr = create_gamma_distr(
    alpha = 0.05,
    beta = create_beta_param(value = "10.0")
  ),
  rate_cg_prior_distr = create_gamma_distr(
    alpha = 0.05,
    beta = create_beta_param(value = "10.0")
  ),
  rate_gt_prior_distr = create_gamma_distr(
    alpha = 0.05,
    beta = create_beta_param(value = "10.0")
  ),
  rate_ac_param = create_rate_ac_param(),
  rate_ag_param = create_rate_ag_param(),
  rate_at_param = create_rate_at_param(),
  rate_cg_param = create_rate_cg_param(),
  rate_ct_param = create_rate_ct_param(),
  rate_gt_param = create_rate_gt_param(),
  freq_equilibrium = "estimated",
  freq_param = create_freq_param()
) {
  if (!is_one_na(id) && !is_id(id)) {
    stop("'id' must be NA (recommended) or an ID")
  }
  if (!is_freq_param(freq_param)) {
    stop("'freq_param' must a valid freq_param. Tip: use 'create_freq_param'")
  }
  if (is_one_double(rate_ac_param)) {
    rate_ac_param <- create_rate_ac_param(value = rate_ac_param)
  }
  if (is_one_double(rate_ag_param)) {
    rate_ag_param <- create_rate_ag_param(value = rate_ag_param)
  }
  if (is_one_double(rate_at_param)) {
    rate_at_param <- create_rate_at_param(value = rate_at_param)
  }
  if (is_one_double(rate_cg_param)) {
    rate_cg_param <- create_rate_cg_param(value = rate_cg_param)
  }
  if (is_one_double(rate_ct_param)) {
    rate_ct_param <- create_rate_ct_param(value = rate_ct_param)
  }
  if (is_one_double(rate_gt_param)) {
    rate_gt_param <- create_rate_gt_param(value = rate_gt_param)
  }

  create_site_model(
    name = "GTR",
    id = id,
    gamma_site_model = gamma_site_model,
    rate_ac_prior_distr = rate_ac_prior_distr,
    rate_ag_prior_distr = rate_ag_prior_distr,
    rate_at_prior_distr = rate_at_prior_distr,
    rate_cg_prior_distr = rate_cg_prior_distr,
    rate_gt_prior_distr = rate_gt_prior_distr,
    rate_ac_param = rate_ac_param,
    rate_ag_param = rate_ag_param,
    rate_at_param = rate_at_param,
    rate_cg_param = rate_cg_param,
    rate_ct_param = rate_ct_param,
    rate_gt_param = rate_gt_param,
    freq_equilibrium = freq_equilibrium,
    freq_param = freq_param
  )
}

#' Create an HKY site model
#' @inheritParams create_site_model
#' @param kappa obsoleted parameter. It is the value in the `kappa_param`
#' argument
#' @param kappa_param a `kappa` parameter,
#' as created by \link{create_kappa_param}
#' @param kappa_prior_distr the distribution of the kappa prior,
#'   which is a log-normal distribution
#'   (as created by \code{\link{create_log_normal_distr}})
#'   by default
#' @param freq_equilibrium the frequency in which the rates are at equilibrium
#'   are either \code{estimated}, \code{empirical} or \code{all_equal}.
#'   \code{get_freq_equilibrium_names} returns the possible values
#'   for \code{freq_equilibrium}
#' @param freq_param a `freq` parameter,
#' as created by \link{create_freq_param}
#' @return an HKY site_model
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_on_ci()) {
#'
#'   hky_site_model <- create_hky_site_model()
#'   output_filename <- get_beautier_tempfilename()
#'   create_beast2_input_file(
#'     input_filename = get_fasta_filename(),
#'     output_filename = output_filename,
#'     site_model = hky_site_model
#'   )
#'   file.remove(output_filename)
#'
#'   remove_beautier_folder()
#' }
#' @aliases create_hky_site_model create_site_model_hky
#' @export create_hky_site_model create_site_model_hky
create_hky_site_model <- create_site_model_hky <- function(
  id = NA,
  kappa = "obsolete",
  kappa_param = create_kappa_param(value = "2.0"),
  gamma_site_model = create_gamma_site_model(),
  kappa_prior_distr = create_log_normal_distr(
    m = create_m_param(value = "1.0"),
    s = 1.25
  ),
  freq_equilibrium = "estimated",
  freq_param = create_freq_param()
) {
  if (kappa != "obsolete") {
    stop(
      "Parameter 'kappa' is obsolete. \n",
      "Use 'kappa_param' instead.\n",
      " \n",
      "Example: \n",
      "  create_hky_site_model(kappa = \"123\") # OBSOLETE \n",
      "  create_hky_site_model(kappa_param = create_kappa_param(value = \"123\")) # NEW" # nolint
    )
  }
  create_site_model(
    name = "HKY",
    id = id,
    gamma_site_model = gamma_site_model,
    kappa_param = kappa_param,
    kappa_prior_distr = kappa_prior_distr,
    freq_equilibrium = freq_equilibrium,
    freq_param = freq_param
  )
}

#' Create a JC69 site model
#' @inheritParams create_site_model
#' @return a JC69 site_model
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_on_ci()) {
#'
#'   jc69_site_model <- create_jc69_site_model()
#'
#'   output_filename <- get_beautier_tempfilename()
#'   create_beast2_input_file(
#'     input_filename = get_fasta_filename(),
#'     output_filename = output_filename,
#'     site_model = jc69_site_model
#'   )
#'   file.remove(output_filename)
#'
#'   remove_beautier_folder()
#' }
#' @aliases create_jc69_site_model create_site_model_jc69
#' @export create_jc69_site_model create_site_model_jc69
create_jc69_site_model <- create_site_model_jc69 <- function(
  id = NA,
  gamma_site_model = create_gamma_site_model()
) {
  create_site_model(
    name = "JC69",
    id = id,
    gamma_site_model = gamma_site_model
  )
}

#' Create a TN93 site model
#' @inheritParams create_site_model
#' @param kappa_1_prior_distr the distribution of the kappa 1 prior,
#'   which is a log-normal distribution
#'   (as created by \code{\link{create_log_normal_distr}})
#'   by default
#' @param kappa_2_prior_distr the distribution of the kappa 2 prior,
#'   which is a log-normal distribution
#'   (as created by \code{\link{create_log_normal_distr}})
#'   by default
#' @param kappa_1_param the 'kappa 1' parameter,
#'   a numeric value.
#'   For advanced usage, use the structure
#'   as returned by \code{\link{create_kappa_1_param}}
#' @param kappa_2_param the 'kappa 2' parameter,
#'   a numeric value.
#'   For advanced usage, use the structure
#'   as returned by \code{\link{create_kappa_2_param}}
#' @param freq_equilibrium the frequency in which the rates are at equilibrium
#'   are either \code{estimated}, \code{empirical} or \code{all_equal}.
#'   \code{get_freq_equilibrium_names} returns the possible values
#'   for \code{freq_equilibrium}
#' @param freq_param a `freq` parameter,
#' as created by \link{create_freq_param}
#' @return a TN93 site_model
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_on_ci()) {
#'
#'   tn93_site_model <- create_tn93_site_model(
#'     kappa_1_param = 2.0,
#'     kappa_2_param = 2.0
#'   )
#'
#'   output_filename <- get_beautier_tempfilename()
#'   create_beast2_input_file(
#'     input_filename = get_fasta_filename(),
#'     output_filename = output_filename,
#'     site_model = tn93_site_model
#'   )
#'   file.remove(output_filename)
#'
#'   remove_beautier_folder()
#' }
#' @aliases create_tn93_site_model create_site_model_tn93
#' @export create_tn93_site_model create_site_model_tn93
create_tn93_site_model <- create_site_model_tn93 <- function(
  id = NA,
  gamma_site_model = create_gamma_site_model(),
  kappa_1_param = create_kappa_1_param(),
  kappa_2_param = create_kappa_2_param(),
  kappa_1_prior_distr = create_log_normal_distr(
    m = 1.0,
    s = 1.25
  ),
  kappa_2_prior_distr = create_log_normal_distr(
    m = 1.0,
    s = 1.25
  ),
  freq_equilibrium = "estimated",
  freq_param = create_freq_param()
) {
  if (is_one_double(kappa_1_param)) {
    kappa_1_param <- create_kappa_1_param(value = kappa_1_param)
  }
  if (is_one_double(kappa_2_param)) {
    kappa_2_param <- create_kappa_2_param(value = kappa_2_param)
  }
  create_site_model(
    name = "TN93",
    id = id,
    gamma_site_model = gamma_site_model,
    kappa_1_prior_distr = kappa_1_prior_distr,
    kappa_2_prior_distr = kappa_2_prior_distr,
    kappa_1_param = kappa_1_param,
    kappa_2_param = kappa_2_param,
    freq_equilibrium = freq_equilibrium,
    freq_param = freq_param
  )
}
