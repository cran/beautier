#' Determines if the argument is a double
#' @param x the object to be determined of if it is one double
#' @return TRUE if the argument is one floating point value, FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_empty_beautier_folder()
#'
#' # TRUE
#' is_one_double(314)
#' is_one_double(0)
#' is_one_double(-314)
#' is_one_double(3.14)
#'
#' # FALSE
#' is_one_double(NULL)
#' is_one_double(NA)
#' is_one_double(Inf)
#' is_one_double("nonsense")
#' is_one_double(is_one_double)
#' is_one_double(c())
#' is_one_double(c(1, 2))
#'
#' check_empty_beautier_folder()
#' @export
is_one_double <- function(x) {
  if (length(x) != 1) return(FALSE)
  if (is.function(x)) return(FALSE)
  if (is.na(x)) return(FALSE)
  if (is.infinite(x)) return(FALSE)
  is.numeric(x)
}
