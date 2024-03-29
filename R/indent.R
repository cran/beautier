#' Indent text for a certain number of spaces.
#' If the text is only whitespace, leave it as such
#' @param text the text to indent
#' @param n_spaces the number of spaces to add before the text. BEAUti uses
#'   four spaces by default
#' @return the indented text
#' @author Richèl J.C. Bilderbeek
#' @export
indent <- function(
  text,
  n_spaces = 4
) {
  check_number_whole(n_spaces, min = 0)

  check_false(is.null(text))
  for (i in seq_along(text)) {
    if (text[i] == "") next
    spaces <- paste(rep(" ", n_spaces), collapse = "")
    text[i] <- paste0(spaces, text[i])
  }
  text
}
