% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_beast2_input_distr.R
\name{yule_tree_prior_to_xml_prior_distr}
\alias{yule_tree_prior_to_xml_prior_distr}
\title{Creates the \code{prior} section in the prior section of
the prior section of the distribution section
of a BEAST2 XML parameter file for a Yule tree prior}
\usage{
yule_tree_prior_to_xml_prior_distr(
  yule_tree_prior,
  beauti_options = create_beauti_options()
)
}
\arguments{
\item{yule_tree_prior}{a Yule tree_prior,
as created by \code{\link{create_yule_tree_prior}}}

\item{beauti_options}{one BEAUti options object,
as returned by \code{\link{create_beauti_options}}}
}
\value{
lines of XML text
}
\description{
Creates the \code{prior} section in the prior section of
the prior section of the distribution section
of a BEAST2 XML parameter file for a Yule tree prior
}
\examples{
check_empty_beautier_folder()

 # <distribution id="posterior" spec="util.CompoundDistribution">
 #     <distribution id="prior" spec="util.CompoundDistribution">
 #       HERE, where the ID of the distribution is 'prior'
 #     </distribution>
 #     <distribution id="likelihood" ...>
 #     </distribution>
 # </distribution>

check_empty_beautier_folder()
}
\author{
Richèl J.C. Bilderbeek
}
