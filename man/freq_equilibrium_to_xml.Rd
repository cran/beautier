% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/freq_equilibrium_to_xml.R
\name{freq_equilibrium_to_xml}
\alias{freq_equilibrium_to_xml}
\title{Creates the \code{freq_equilibrium} as XML}
\usage{
freq_equilibrium_to_xml(freq_equilibrium, id)
}
\arguments{
\item{freq_equilibrium}{a \code{freq_equilibrium} name}

\item{id}{a site model's name}
}
\value{
the \code{freq_equilibrium} as XML
}
\description{
Creates the \code{freq_equilibrium} as XML
}
\examples{
check_empty_beautier_folder()

freq_equilibrium_to_xml(freq_equilibrium = "estimated", id = "my_id")

check_empty_beautier_folder()
}
\author{
Richèl J.C. Bilderbeek
}
