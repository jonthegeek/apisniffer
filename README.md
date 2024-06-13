
<!-- README.md is generated from README.Rmd. Please edit that file -->

# apisniffer

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/apisniffer)](https://CRAN.R-project.org/package=apisniffer)
[![Codecov test
coverage](https://codecov.io/gh/jonthegeek/apisniffer/branch/main/graph/badge.svg)](https://app.codecov.io/gh/jonthegeek/apisniffer?branch=main)
[![R-CMD-check](https://github.com/jonthegeek/apisniffer/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jonthegeek/apisniffer/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

When you load a web page, it often calls APIs to populate the page with
data. If you know what you’re looking for, you can use Chrome Devtools
to find these API calls. This package aims to automate that process.

This package is extremely experimental. The data returned by the main
`sniff()` function will definitely change in upcoming versions (to be
more useful and user-friendly). You also can’t currently interact with
the page, which in a lot of cases means you can’t actually trigger the
API calls of interest. But it’s a start!

## Installation

<div class=".pkgdown-release">

Install the released version of apisniffer from
[CRAN](https://cran.r-project.org/):

``` r
install.packages("apisniffer")
```

</div>

<div class=".pkgdown-devel">

Install the development version of apisniffer from
[GitHub](https://github.com/):

``` r
# install.packages("pak")
pak::pak("jonthegeek/apisniffer")
```

</div>

## Usage

The single exported function is `sniff()`.

``` r
api_information <- sniff("https://proton.me/mail/pricing")
```

## Code of Conduct

Please note that the apisniffer project is released with a [Contributor
Code of
Conduct](https://jonthegeek.github.io/apisniffer/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
