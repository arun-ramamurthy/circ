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
#' @import purrr
#' @export
lcirc <- function(str, N = 1L) {
  str %<>%  check_str()
  N %<>% check_N()

  lcircs <- c(list(lcirc_singleton) %>% rep(N))
  lcircs %>%
    reduce(~ invoke(.y, .x),
           .init = str)
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
#' @import purrr
#' @export
rcirc <- function(str, N = 1L) {
  str %<>%  check_str()
  N %<>% check_N()

  rcircs <- c(list(rcirc_singleton) %>% rep(N))
  rcircs %>%
    reduce(~ invoke(.y, .x),
           .init = str)
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

#' @import stringr
lcirc_singleton <- function(str) {
  first <- str %>% str_sub(end = 1)
  rest <- str %>% str_sub(start = 2)
  paste0(rest, first)
}

#' @import stringr
rcirc_singleton <- function(str) {
  last <- str %>% str_sub(start = -1)
  rest <- str %>% str_sub(end = -2)
  paste0(last, rest)
}

