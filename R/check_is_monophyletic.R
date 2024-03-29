#' Check if \code{is_monophyletic} has a valid value.
#'
#' Will \link{stop} if not.
#' @inheritParams default_params_doc
#' @return No return value, called for side effects
#' @export
check_is_monophyletic <- function(is_monophyletic) {
  if (!beautier::is_one_bool(is_monophyletic)) {
    stop("'is_monophyletic' must be either TRUE or FALSE")
  }
  invisible(is_monophyletic)
}
