#' Deprecation notice
#'
#' The functions listed here are deprecated.
#' This means that they once existed in earlier versions of the
#' of the \pkg{prioritizrdata} package, but they have since been removed
#' entirely, replaced by other functions, or renamed as other functions
#' in newer versions.
#' To help make it easier to transition to new versions of the
#' \pkg{prioritizrdata} package, we have listed alternatives for deprecated the
#' functions (where applicable).
#' If a function is described as being renamed, then this means
#' that only the name of the function has changed
#' (i.e., the inputs, outputs, and underlying code remain the same).
#'
#' @details
#' The following functions have been deprecated:
#'
#' \describe{
#'
#' \item{`get_wa_features()`}{renamed as the [get_wa_species()] function.}
#'
#' }
#'
#' @keywords deprecated
#'
#' @name prioritizrdata-deprecated
NULL

#' @rdname prioritizrdata-deprecated
#' @export
get_wa_features <- function() {
  if (interactive()) {
    # nocov start
    warning(
      paste(
        "`get_wa_features()` has been deprecated,",
        "use `get_wa_species()` instead."
      ),
      call. = FALSE,
      immediate. = TRUE
    )
    # nocov end
  }
  get_wa_species()
}
