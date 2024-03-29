% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_param.R
\name{is_beta_param}
\alias{is_beta_param}
\title{Determine if the object is a valid
beta parameter}
\usage{
is_beta_param(x)
}
\arguments{
\item{x}{an object, to be determined if it is a valid
beta parameter}
}
\value{
TRUE if x is a valid beta parameter,
  FALSE otherwise
}
\description{
Determine if the object is a valid
beta parameter
}
\examples{
check_empty_beautier_folder()

is_beta_param(create_alpha_param())
is_beta_param(create_beta_param())
is_beta_param(create_clock_rate_param())
is_beta_param(create_kappa_1_param())
is_beta_param(create_kappa_2_param())
is_beta_param(create_lambda_param())
is_beta_param(create_m_param())
is_beta_param(create_mean_param())
is_beta_param(create_mu_param())
is_beta_param(create_rate_ac_param())
is_beta_param(create_rate_ag_param())
is_beta_param(create_rate_at_param())
is_beta_param(create_rate_cg_param())
is_beta_param(create_rate_ct_param())
is_beta_param(create_rate_gt_param())
is_beta_param(create_s_param())
is_beta_param(create_scale_param())
is_beta_param(create_sigma_param())

is_beta_param(NA)
is_beta_param(NULL)
is_beta_param("nonsense")
is_beta_param(create_jc69_site_model())
is_beta_param(create_strict_clock_model())
is_beta_param(create_yule_tree_prior())
is_beta_param(create_mcmc())

check_empty_beautier_folder()
}
\author{
Richèl J.C. Bilderbeek
}
