% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_freq_equilibrium_name.R
\name{is_freq_equilibrium_name}
\alias{is_freq_equilibrium_name}
\title{Checks if \code{name} is a valid \code{freq_equilibrium} argument value}
\usage{
is_freq_equilibrium_name(name)
}
\arguments{
\item{name}{the name to check if it is a valid \code{freq_equilibrium}
argument value}
}
\value{
TRUE if the name is a valid \code{freq_equilibrium} value
}
\description{
Checks if \code{name} is a valid \code{freq_equilibrium} argument value
}
\examples{
check_empty_beautier_folder()

# TRUE
is_freq_equilibrium_name("estimated")
is_freq_equilibrium_name("empirical")
is_freq_equilibrium_name("all_equal")
# FALSE
is_freq_equilibrium_name("nonsense")

check_empty_beautier_folder()
}
\seealso{
the \code{freq_equilibrium} argument is used by
  \code{\link{create_gtr_site_model}},
  \code{\link{create_hky_site_model}},
  and \code{\link{create_tn93_site_model}}
}
\author{
Richèl J.C. Bilderbeek
}
