% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clock_models_to_xml_state.R
\name{clock_models_to_xml_state_check_deprecated}
\alias{clock_models_to_xml_state_check_deprecated}
\title{Internal function to check if \link{clock_models_to_xml_state}
uses deprecated arguments.}
\usage{
clock_models_to_xml_state_check_deprecated(
  clock_models,
  mrca_priors,
  has_tip_dating
)
}
\arguments{
\item{clock_models}{a list of one or more clock models,
as returned by \code{\link{create_clock_model}}}

\item{mrca_priors}{a list of one or more Most Recent Common Ancestor priors,
as returned by \code{\link{create_mrca_prior}}}

\item{has_tip_dating}{TRUE if the user has supplied tip dates,
FALSE otherwise}
}
\value{
Nothing
}
\description{
This internal function checks if \link{clock_models_to_xml_state}
uses deprecated arguments.
Will \link{stop} if this is the case
}
\author{
Richèl J.C. Bilderbeek
}
