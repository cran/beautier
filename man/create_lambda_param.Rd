% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_param.R
\name{create_lambda_param}
\alias{create_lambda_param}
\alias{create_param_lambda}
\title{Create a parameter called lambda}
\usage{
create_lambda_param(id = NA, value = 0)
}
\arguments{
\item{id}{the parameter's ID}

\item{value}{value of the parameter}
}
\value{
a parameter called lambda
}
\description{
Create a parameter called lambda
}
\note{
this parameter is used in a Poisson distribution
  (as returned by \code{\link{create_poisson_distr}})
}
\examples{
if (is_on_ci()) {

  # Create the parameter
  lambda_param <- create_lambda_param()

  # Use the parameter in a distribution
  poisson_distr <- create_poisson_distr(
    lambda = lambda_param
  )

  # Use the distribution to create a BEAST2 input file
  beast2_input_file <- get_beautier_tempfilename()
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = poisson_distr
    )
  )
  file.remove(beast2_input_file)

  remove_beautier_folder()
}
}
\seealso{
the function \code{\link{create_param}} contains a list
  of all parameters that can be created
}
\author{
Richèl J.C. Bilderbeek
}
