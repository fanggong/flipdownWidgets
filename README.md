
<!-- README.md is generated from README.Rmd. Please edit that file -->

# flipdownWidgets

<!-- badges: start -->
<!-- badges: end -->

The goal of flipdownWidgets is to include a countdown widget
<https://github.com/PButcher/flipdown> in all R contexts with the
convenience of ‘htmlwidgets’.

## Installation

You can install the released version of flipdownWidgets from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("flipdownWidgets")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("fanggong/flipdownWidgets")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(flipdownWidgets)
flipdownWidgets(
  Sys.time() + 60*60*24*100, theme = "dark", headings = c("天", "时", "分", "秒")
)
```
