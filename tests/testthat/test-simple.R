context("Simple unit testing")

test_that("lcirc works once", {
  expect_equal(lcirc("statistics", 1),
               "tatisticss")
})

test_that("rcirc works once", {
  expect_equal(rcirc("statistics", 1),
               "sstatistic")
})

test_that("lcirc works more than once", {
  expect_equal(lcirc("statistics", 3),
               "tisticssta")
})

test_that("rcirc works more than once", {
  expect_equal(rcirc("statistics", 3),
               "icsstatist")
})

test_that("zero shifts are identity", {
  str <- "statistics"
  expect_equal(lcirc(str, 0),
               str)
  expect_equal(rcirc(str, 0),
               str)
})

test_that("N of the same operation is identity", {
  str <- "statistics"
  N <- nchar(str)
  expect_equal(lcirc(str, N),
               str)
  expect_equal(rcirc(str, N),
               str)
})

