% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_param.R
\name{is_lambda_param}
\alias{is_lambda_param}
\title{Determine if the object is a valid lambda parameter}
\usage{
is_lambda_param(x)
}
\arguments{
\item{x}{an object, to be determined if it is a valid
lambda parameter}
}
\value{
TRUE if x is a valid lambda parameter,
  FALSE otherwise
}
\description{
Determine if the object is a valid lambda parameter
}
\examples{
check_empty_beautier_folder()

is_lambda_param(create_alpha_param())
is_lambda_param(create_beta_param())
is_lambda_param(create_clock_rate_param())
is_lambda_param(create_kappa_1_param())
is_lambda_param(create_kappa_2_param())
is_lambda_param(create_lambda_param())
is_lambda_param(create_m_param())
is_lambda_param(create_mean_param())
is_lambda_param(create_mu_param())
is_lambda_param(create_rate_ac_param())
is_lambda_param(create_rate_ag_param())
is_lambda_param(create_rate_at_param())
is_lambda_param(create_rate_cg_param())
is_lambda_param(create_rate_ct_param())
is_lambda_param(create_rate_gt_param())
is_lambda_param(create_s_param())
is_lambda_param(create_scale_param())
is_lambda_param(create_sigma_param())

is_lambda_param(NA)
is_lambda_param(NULL)
is_lambda_param("nonsense")
is_lambda_param(create_jc69_site_model())
is_lambda_param(create_strict_clock_model())
is_lambda_param(create_yule_tree_prior())
is_lambda_param(create_mcmc())

check_empty_beautier_folder()
}
\seealso{
lambda parameters are returned by \code{\link{create_lambda_param}}
}
\author{
Richèl J.C. Bilderbeek
}
