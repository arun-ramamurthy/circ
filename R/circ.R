### Implementations of the lcirc and rcirc functions

#' Conduct LCIRC-N on a string.
#'
#' Shift a string left N times, circulating overflow back onto the right side.
#'
#' @param str one or more strings, as a character vector
#' @param N a single non-negative integer
#' @return \code{str} after left circulating N times
#' @examples
#' lcirc("statistics", 3)
#' @import magrittr
#' @import dplyr
#' @export
lcirc <- function(str, N = 1L) {
  str %<>%  check_str()
  N %<>% check_N()

  return(str)
}

#' Conduct RCIRC-N on a string.
#'
#' Shift a string right N times, circulating overflow back onto the left side.
#'
#' @param str one or more strings, as a character vector
#' @param N a single non-negative integer
#' @return \code{str} after right circulating N times
#' @examples
#' rcirc("statistics", 3)
#' @import magrittr
#' @import dplyr
#' @export
rcirc <- function(str, N = 1L) {
  str %<>%  check_str()
  N %<>% check_N()

  return(str)
}

#' @import glue
check_str <- function(str) {
  if (! is.character(str)) stop(glue("`str` must be a character vector, not a {mode(str)}."))
  return(str)
}

#' @import glue
check_N <- function(N) {
  base_error <- "`N` must be a single non-negative integer"
  len <- length(N)
  if(len != 1) stop(glue("{base_error}, not a vector of length {len}."))
  N %<>% {ifelse(is.numeric(.), as.integer(.), .)}
  if(! is.integer(N)) stop(glue("{base_error}, not a {mode(N)}."))
  if(is.na(N)) stop(glue("{base_error}, not an NA value."))
  if(N < 0) stop(glue("{base_error}, not a negative integer."))
  return(N)
}
