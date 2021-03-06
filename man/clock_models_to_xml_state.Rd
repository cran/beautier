% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clock_models_to_xml_state.R
\name{clock_models_to_xml_state}
\alias{clock_models_to_xml_state}
\title{Converts one or more clock models to the \code{state} section of the
XML as text}
\usage{
clock_models_to_xml_state(
  inference_model,
  clock_models = "deprecated",
  mrca_priors = "deprecated",
  has_tip_dating = "deprecated"
)
}
\arguments{
\item{inference_model}{a Bayesian phylogenetic inference model.
An inference model is the complete model setup in which a site model,
clock model, tree prior and more are specified.
Use \link{create_inference_model} to create an inference model.
Use \link{check_inference_model} to check if  an inference model is valid.
Use \link{rename_inference_model_filenames} to rename the files in an
inference model.}

\item{clock_models}{a list of one or more clock models,
as returned by \code{\link{create_clock_model}}}

\item{mrca_priors}{a list of one or more Most Recent Common Ancestor priors,
as returned by \code{\link{create_mrca_prior}}}

\item{has_tip_dating}{TRUE if the user has supplied tip dates,
FALSE otherwise}
}
\value{
lines of XML text, without indentation nor \code{state}
  tags
}
\description{
Converts one or more clock models to the \code{state} section of the
XML as text
}
\author{
Richèl J.C. Bilderbeek
}
