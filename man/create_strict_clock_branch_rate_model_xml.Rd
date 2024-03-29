% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_strict_clock_branch_rate_model_xml.R
\name{create_strict_clock_branch_rate_model_xml}
\alias{create_strict_clock_branch_rate_model_xml}
\title{Internal function.}
\usage{
create_strict_clock_branch_rate_model_xml(inference_model)
}
\arguments{
\item{inference_model}{a Bayesian phylogenetic inference model.
An inference model is the complete model setup in which a site model,
clock model, tree prior and more are specified.
Use \link{create_inference_model} to create an inference model.
Use \link{check_inference_model} to check if  an inference model is valid.
Use \link{rename_inference_model_filenames} to rename the files in an
inference model.}
}
\value{
a character vector of XML strings
}
\description{
Internal function to create the \code{branchRateModel} section
of the XML as text, for a strict clock model
}
\author{
Richèl J.C. Bilderbeek
}
