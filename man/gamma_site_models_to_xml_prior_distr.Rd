% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gamma_site_models_to_xml_prior_distr.R
\name{gamma_site_models_to_xml_prior_distr}
\alias{gamma_site_models_to_xml_prior_distr}
\title{Creates the gamma site models section in the distribution section
of a BEAST2 XML parameter file}
\usage{
gamma_site_models_to_xml_prior_distr(site_models)
}
\arguments{
\item{site_models}{one or more site models,
as returned by \code{\link{create_site_model}}}
}
\value{
lines of XML text
}
\description{
Creates the gamma site models section in the distribution section
of a BEAST2 XML parameter file
}
\author{
Richèl J.C. Bilderbeek
}
