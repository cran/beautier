#' Determine if the object is a valid \code{beauti_options}
#' @param x an object, to be determined if it is a \code{beauti_options}
#' @return \link{TRUE} if the object is a valid \code{beauti_options},
#'   \link{FALSE} otherwise
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_empty_beautier_folder()
#'
#' # TRUE
#' is_beauti_options(create_beauti_options())
#'
#' # FALSE
#' is_beauti_options("nonsense")
#' is_beauti_options(NA)
#' is_beauti_options(NULL)
#' is_beauti_options("")
#' is_beauti_options(c())
#'
#' check_empty_beautier_folder()
#' @seealso use \link{create_beauti_options} to create a valid
#' \code{beauti_options} object
#' @export
is_beauti_options <- function(
  x
) {
  if (!"capitalize_first_char_id" %in% names(x)) return(FALSE)
  if (!"nucleotides_uppercase" %in% names(x)) return(FALSE)
  if (!"sequence_indent" %in% names(x)) return(FALSE)
  TRUE
}
