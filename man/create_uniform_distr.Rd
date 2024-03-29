% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_distr.R
\name{create_uniform_distr}
\alias{create_uniform_distr}
\alias{create_distr_uniform}
\title{Create a uniform distribution}
\usage{
create_uniform_distr(id = NA, value = NA, lower = NA, upper = Inf)
}
\arguments{
\item{id}{the distribution's ID}

\item{value}{the initial value for the MCMC}

\item{lower}{the lower bound, the lowest possible value}

\item{upper}{an upper limit of the uniform distribution.
If the upper limits needs to be infinity, set \code{upper} to \code{Inf}.}
}
\value{
a uniform distribution
}
\description{
Create a uniform distribution
}
\examples{
if (is_on_ci()) {

  uniform_distr <- create_uniform_distr()

  beast2_input_file <- get_beautier_tempfilename()
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = uniform_distr
    )
  )
  file.remove(beast2_input_file)

  remove_beautier_folder()
}
}
\seealso{
the function \code{\link{create_distr}} shows an overview
  of all supported distributions
}
\author{
Richèl J.C. Bilderbeek
}
