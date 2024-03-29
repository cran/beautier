#' Get the base of the filename base without extension
#'
#' The path need not to actually exist
#' @param filename A filename
#' @return That filename without its full path and extension
#' @examples
#' check_empty_beautier_folder()
#'
#' # Path need not exist, use UNIX path as example
#' # test
#' get_file_base_sans_ext("/home/homer/test.txt")
#'
#' check_empty_beautier_folder()
#' @author Richèl J.C. Bilderbeek
#' @export
get_file_base_sans_ext <- function(filename) {
  basename(tools::file_path_sans_ext(filename))
}
