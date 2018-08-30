context("Sanity checks are in place")

test_that("non-string argument throws an exception", {
  str <- 123
  expect_error(lcirc(str),
               "`str` must be a character vector.+")
  expect_error(rcirc(str),
               "`str` must be a character vector.+")
})

test_that("non-integer N throws an exception", {
  str <- "statistics"
  N <- 4.5
  expect_error(lcirc(str),
               "`N` must be a non-negative integer.+")
  expect_error(rcirc(str),
               "`N` must be a non-negative integer.+")
})

test_that("negative N throws an exception", {
  str <- "statistics"
  N <- -3
  expect_error(lcirc(str),
               "`N` must be a non-negative integer.+")
  expect_error(rcirc(str),
               "`N` must be a non-negative integer.+")
})
