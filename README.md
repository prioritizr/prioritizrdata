
<!--- README.md is generated from README.Rmd. Please edit that file -->

# prioritizrdata: Conservation Planning Datasets

[![lifecycle](https://img.shields.io/badge/Lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![R-CMD-check-Ubuntu](https://img.shields.io/github/actions/workflow/status/prioritizr/prioritizrdata/R-CMD-check-ubuntu.yaml?branch=main&label=Ubuntu)](https://github.com/prioritizr/prioritizrdata/actions)
[![R-CMD-check-Windows](https://img.shields.io/github/actions/workflow/status/prioritizr/prioritizrdata/R-CMD-check-windows.yaml?branch=main&label=Windows)](https://github.com/prioritizr/prioritizrdata/actions)
[![R-CMD-check-macOS](https://img.shields.io/github/actions/workflow/status/prioritizr/prioritizrdata/R-CMD-check-macos.yaml?branch=main&label=macOS)](https://github.com/prioritizr/prioritizrdata/actions)
[![Documentation](https://img.shields.io/github/actions/workflow/status/prioritizr/prioritizrdata/documentation.yaml?branch=main&label=Documentation)](https://github.com/prioritizr/prioritizrdata/actions)
[![Coverage
Status](https://img.shields.io/codecov/c/github/prioritizr/prioritizrdata?label=Coverage)](https://app.codecov.io/gh/prioritizr/prioritizrdata/branch/main)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/prioritizrdata)](https://CRAN.R-project.org/package=prioritizrdata)

The *prioritizrdata R* package is a supplemental package that contains
example datasets for conservation planning. It is intended to be used
alongside the [*prioritizr R* package](https://prioritizr.net).

## Overview

This package contains the following datasets.

-   **Tasmania dataset**: Conservation planning dataset for Tasmania,
    Australia.
-   **Salt Spring Island dataset**: Conservation planning dataset for
    Tasmania, Australia.
-   **Washington dataset**: Conservation planning dataset for
    Washington, The United States of America.

## Installation

The latest official version of the *prioritizrdata R* package can be
installed using the following *R* code.

``` r
install.packages("prioritizrdata", repos = "https://cran.rstudio.com/")
```

Alternatively, the latest development version can be installed using the
following code. Please note that while developmental versions may
contain additional features not present in the official version, they
may also contain coding errors.

``` r
if (!require(devtools))
  install.packages("devtools")
devtools::install_github("prioritizr/prioritizrdata")
```

## Citation

Please cite the *prioritizrdata R* package when using it in
publications. To cite the latest official version, please use:

> Hanson JO, Schuster R, Morrell N, Strimas-Mackey M, Watts ME, Arcese
> P, Bennett J, Possingham HP (2023). prioritizrdata: Conservation
> Planning Datasets. R package version 0.3.2. Available at
> <https://CRAN.R-project.org/package=prioritizrdata>.

Alternatively, to cite the latest development version, please use:

> Hanson JO, Schuster R, Morrell N, Strimas-Mackey M, Watts ME, Arcese
> P, Bennett J, Possingham HP (2023). prioritizrdata: Conservation
> Planning Datasets. R package version 0.3.2.1. Available at
> <https://github.com/prioritizr/prioritizrdata>.
