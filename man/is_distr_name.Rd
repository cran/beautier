% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_distr_name.R
\name{is_distr_name}
\alias{is_distr_name}
\title{Determines if the name is a valid distribution name}
\usage{
is_distr_name(name)
}
\arguments{
\item{name}{the name to be tested}
}
\value{
TRUE if the name is a valid distribution name, FALSE otherwise
}
\description{
Determines if the name is a valid distribution name
}
\examples{
# TRUE
is_distr_name("uniform")
is_distr_name("normal")
is_distr_name("one_div_x")
is_distr_name("log_normal")
is_distr_name("exponential")
is_distr_name("gamma")
is_distr_name("beta")
is_distr_name("laplace")
is_distr_name("inv_gamma")
is_distr_name("poisson")
# FALSE
is_distr_name("nonsense")
}
\author{
Richèl J.C. Bilderbeek
}
