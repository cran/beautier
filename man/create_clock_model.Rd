% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_clock_model.R
\name{create_clock_model}
\alias{create_clock_model}
\title{General function to create a clock model}
\usage{
create_clock_model(name, id, ...)
}
\arguments{
\item{name}{the clock model name. Valid
names can be found in \code{get_clock_model_names}}

\item{id}{a clock model's ID}

\item{...}{specific clock model parameters}
}
\value{
a valid clock model
}
\description{
General function to create a clock model
}
\note{
Prefer using the named function
  \code{\link{create_rln_clock_model}}
  and \code{\link{create_strict_clock_model}}
}
\examples{
if (is_on_ci()) {
  # Can use any of these models
  strict_clock_model <- create_strict_clock_model()
  rln_clock_model <- create_rln_clock_model()

  beast2_input_file <- get_beautier_tempfilename()
  create_beast2_input_file(
    get_fasta_filename(),
    beast2_input_file,
    clock_model = strict_clock_model
  )
  file.remove(beast2_input_file)

  remove_beautier_folder()
}
}
\seealso{
An alignment ID can be extracted from
  its FASTA filename using \code{\link{get_alignment_id}}.
  For more examples about creating a relaxed log-normal clock
  model, see \code{\link{create_rln_clock_model}}.
  For more examples about creating a strict clock
  model, see \code{\link{create_strict_clock_model}}.
}
\author{
Richèl J.C. Bilderbeek
}
