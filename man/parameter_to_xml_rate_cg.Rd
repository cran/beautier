% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parameter_to_xml.R
\name{parameter_to_xml_rate_cg}
\alias{parameter_to_xml_rate_cg}
\title{Converts a 'rate CG' parameter to XML}
\usage{
parameter_to_xml_rate_cg(parameter, which_name = "state_node")
}
\arguments{
\item{parameter}{a 'rate CG' parameter,
a numeric value.
For advanced usage, use the structure
as created by \code{\link{create_rate_cg_param}})}

\item{which_name}{the name, can be \code{state_node} or \code{rate_name}}
}
\value{
the parameter as XML text
}
\description{
Converts a 'rate CG' parameter to XML
}
\author{
Richèl J.C. Bilderbeek
}
