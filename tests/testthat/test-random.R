context("Randomized testing")

library(purrr)
set.seed(888)

shuffle <- function(lst) {
  lst %>% sample(size = length(.), replace = F)
}

test_that("lcirc and rcirc cancel out when used for large N", {
  str <- "statistics"
  N <- sample.int(1000, size = 1)

  output <-
    str %>%
    lcirc(N) %>%
    rcirc(N)

  expect_equal(output,
               str)
})

test_that("lcirc and rcirc cancel out if used successively", {
  str <- "statistics"
  N <- sample.int(100, size = 1)

  circs <-
    c(list(lcirc) %>% rep(N),
      list(rcirc) %>% rep(N))
  output <-
    circs %>%
    reduce(~ invoke(.y, .x),
           .init = str)

  expect_equal(output,
               str)
})

test_that("lcirc and rcirc cancel out if used in a random order", {
  str <- "statistics"
  N <- sample.int(100, size = 1)
  circs <-
    c(list(lcirc) %>% rep(N),
      list(rcirc) %>% rep(N)) %>%
    shuffle()

  output <-
    circs %>%
    reduce(~ invoke(.y, .x),
           .init = str)

  expect_equal(output,
               str)
})
