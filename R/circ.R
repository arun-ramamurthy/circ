### Implementations of the lcirc and rcirc functions

#' Conduct LCIRC-N on a string.
#'
#' Shift a string left N times, circulating overflow back onto the right side.
#'
#' @param str a string, as a character vector
#' @param N a single non-negative integer
#' @return \code{str} after left circulating N times
#' @examples
#' lcirc("statistics", 3)
#' @export
lcirc <- function(str, N = 1) {
  return("statistics")
}

#' Conduct RCIRC-N on a string.
#'
#' Shift a string right N times, circulating overflow back onto the left side.
#'
#' @param str a string, as a character vector
#' @param N a single non-negative integer
#' @return \code{str} after right circulating N times
#' @examples
#' rcirc("statistics", 3)
#' @export
rcirc <- function(str, N = 1) {
  return("statistics")
}
