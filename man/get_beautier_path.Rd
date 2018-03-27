% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_beautier_path.R
\name{get_beautier_path}
\alias{get_beautier_path}
\title{Get the full path of a file in the 'inst/extdata' folder}
\usage{
get_beautier_path(filename)
}
\arguments{
\item{filename}{the file's name, without the path}
}
\value{
the filename's full path
}
\description{
Get the full path of a file in the 'inst/extdata' folder
}
\examples{
  testit::assert(is.character(get_beautier_path("test_output_0.fas")))
  testit::assert(is.character(get_beautier_path("anthus_aco.fas")))
  testit::assert(is.character(get_beautier_path("anthus_nd2.fas")))
}
\seealso{
for more files, use \code{\link{get_beautier_paths}}
}
\author{
Richel J.C. Bilderbeek
}