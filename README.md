<!-- README.md is generated from README.Rmd. Please edit that file -->
circ
====

`circ` is a small library that implements and tests the string
operators, `lcirc` & `rcirc`. The purpose of this package is to showcase
the reproducibility and good software hygiene promoted and easily used
by the modern wave of R programming tools.

Some of the tools showcased by this package are:

-   `packrat`: Self-contained package management  
-   `devtools`: Akin to `tidyverse`, but for easy R package
    development  
-   `usethis`: Automated tasks such as README generation, test
    generation, and Travis setup  
-   `testthat`: Unit testing  
-   `covr`: Coverage testing, including an API for connection with
    [codecov.io]()  
-   `roxygen2`: Automated documentation generation via commenting

Examples
--------

``` r
str <- "statistics"

lcirc(str)
lcirc(str, 3)

rcirc(str, 4)

str %>% lcirc(14) %>% rcirc(31) %>% lcirc(17) 
```
