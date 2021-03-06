% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clock_model_to_xml_tracelog.R
\name{clock_model_to_xml_tracelog}
\alias{clock_model_to_xml_tracelog}
\title{Creates the clock model's XML for the tracelog section}
\usage{
clock_model_to_xml_tracelog(clock_model, mrca_priors = NA)
}
\arguments{
\item{clock_model}{a clock model,
as returned by \code{\link{create_clock_model}}}

\item{mrca_priors}{a list of one or more Most Recent Common Ancestor priors,
as returned by \code{\link{create_mrca_prior}}}
}
\value{
a character vector of XML strings
}
\description{
Creates the clock model's XML for the tracelog section
}
\examples{
# <logger id="tracelog" ...>
#'   # Here
# </logger>
}
\seealso{
all clock models' tracelog section is created
  by \code{\link{clock_models_to_xml_tracelog}}
}
\author{
Richèl J.C. Bilderbeek
}
