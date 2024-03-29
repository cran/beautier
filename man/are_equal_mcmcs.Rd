% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/are_equal_mcmcs.R
\name{are_equal_mcmcs}
\alias{are_equal_mcmcs}
\title{Determine if two MCMCs are equal.}
\usage{
are_equal_mcmcs(mcmc_1, mcmc_2)
}
\arguments{
\item{mcmc_1}{an MCMC, as created by \code{\link{create_mcmc}}}

\item{mcmc_2}{an MCMC, as created by \code{\link{create_mcmc}}}
}
\value{
TRUE if the two MCMCs are equal
}
\description{
Will \link{stop} if the arguments are not MCMCs.
}
\examples{
if (is_on_ci()) {

  check_empty_beautier_folder()

  mcmc_1 <- create_mcmc(chain_length = 1000)
  mcmc_2 <- create_mcmc(chain_length = 314)
  # TRUE
  are_equal_mcmcs(mcmc_1, mcmc_1)
  # FALSE
  are_equal_mcmcs(mcmc_1, mcmc_2)

  check_empty_beautier_folder()
}
}
\seealso{
Use \code{\link{create_mcmc}} to create an MCMC
}
\author{
Richèl J.C. Bilderbeek
}
