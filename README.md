
<!--- README.md is generated from README.Rmd. Please edit that file -->
Conservation planning data sets
===============================

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active) [![Travis Build Status](https://img.shields.io/travis/prioritizr/prioritizrdata/master.svg?label=Mac%20OSX%20%26%20Linux)](https://travis-ci.org/prioritizr/prioritizrdata) [![AppVeyor Build Status](https://img.shields.io/appveyor/ci/jeffreyhanson/prioritizrdata/master.svg?label=Windows)](https://ci.appveyor.com/project/jeffreyhanson/prioritizrdata) [![Coverage Status](https://codecov.io/github/prioritizr/prioritizrdata/coverage.svg?branch=master)](https://codecov.io/github/prioritizr/prioritizrdata?branch=master) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/prioritizrdata)](https://CRAN.R-project.org/package=prioritizrdata)

*Prioritizrdata* is a supplemental package to [prioritizr](https://github.com/prioritizr/prioritizr) containing example datasets for conservation planning. The datasets and tutorials in this package are intended to be used alongside [prioritizr](https://github.com/prioritizr/prioritizr), a package for solving systematic conservation prioritization problems using integer linear programming (ILP) techniques. Users can refer to the vignettes built into the [prioritizr](https://github.com/prioritizr/prioritizr) package to familiarize themselves with the basic usage of functions, and the vignettes built into the *prioritizrdata* package for worked examples with the example datasets.

Overview
--------

This package currently contains two data sets and accompanying tutorials for learning how to use the [prioritizr](https://github.com/prioritizr/prioritizr) package.

-   **Tasmania dataset**: This dataset was included to provide an example of vector shapefile inputs to conservation planning problems. The dataset was obtained from the ["Introduction to Marxan" course](http://marxan.net/courses) and was originally a subset of a larger spatial prioritization project performed under contract to Australia's Department of Environment and Water Resources. Contained within this dataset is one planning unit layer and one features layer with the distributions of 63 vegetation classes in Tasmania, Australia. Refer to the [Tasmania vignette](https://prioritizr.github.io/prioritizrdata/articles/tasmania.html) for a worked example with this dataset.
-   **Salt Spring Island dataset**: This dataset was included to provide an example of raster inputs to conservation planning problems. It was obtained as part of an online [Marxan-based planning tool](http://arcese.forestry.ubc.ca/marxan-tool) created for the Coastal Douglas-fir Conservation Partnership (CDFCP). Contained within this dataset is one planning unit raster layer and one raster stack with the distributions of five key ecological communities. Refer to the [Salt Spring Island vignette](https://prioritizr.github.io/prioritizrdata/articles/saltspring.html) for a worked example with this dataset.

Installation
------------

To install the developmental version *prioritizrdata*, use the following *R* code:

``` r
if(!require(devtools))
  install.packages("devtools")
devtools::install_github("prioritizr/prioritizrdata")
```

Citation
--------

    Hanson JO, Schuster R, Morrell N, Strimas-Mackey M, Watts ME, Arcese P, Bennett J, Possingham HP (2017). prioritizrdata: Conservation planning data sets. R package version 0.2.0.3. https://github.com/prioritizr/prioritizrdata.
