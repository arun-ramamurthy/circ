context("Mixed usage integration tests")

test_that("lcirc and rcirc cancel out if used successively", {
  str <- "statistics"
  str_1 <- str %>% lcirc(5) %>% rcirc(5)
  str_2 <- str %>% rcirc(5) %>% lcirc(5)
  expect_equal(str_1,
               str)
  expect_equal(str_2,
               str)
})

test_that("lcirc and rcirc cancel out if used alternatively", {
  str <- "statistics"
  str_1 <- str %>% lcirc(3) %>% lcirc(1) %>% rcirc(5) %>% lcirc(2) %>% rcirc(2) %>% lcirc(1)
  str_2 <- str %>% rcirc(3) %>% rcirc(1) %>% lcirc(5) %>% rcirc(2) %>% lcirc(2) %>% rcirc(1)
  expect_equal(str_1,
               str)
  expect_equal(str_2,
               str)
})
