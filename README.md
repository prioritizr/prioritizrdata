
<!--- README.md is generated from README.Rmd. Please edit that file -->
Conservation Planning Data Sets
===============================

[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable) [![Travis Build Status](https://img.shields.io/travis/prioritizr/prioritizrdata/master.svg?label=Mac%20OSX%20%26%20Linux)](https://travis-ci.org/prioritizr/prioritizrdata) [![AppVeyor Build Status](https://img.shields.io/appveyor/ci/jeffreyhanson/prioritizrdata/master.svg?label=Windows)](https://ci.appveyor.com/project/jeffreyhanson/prioritizrdata) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/prioritizrdata)](https://CRAN.R-project.org/package=prioritizrdata)

The *prioritizrdata R* package is a supplemental package that contains example datasets and tutorials for conservation planning. It is intended to be used alongside the [*prioritizr R* package](https://github.com/prioritizr/prioritizr)---a package for building and solving systematic conservation prioritization problems using integer linear programming (ILP) techniques---and provides little functionality itself.

Overview
--------

This package currently contains two data sets and accompanying tutorials for learning how to use the [the *prioritizr R* package](https://github.com/prioritizr/prioritizr).

-   **Tasmania dataset**: This dataset was included to show how prioritizations can be created using vector (shapefile) data. It obtained from the ["Introduction to Marxan" course](http://marxan.net/courses) and was originally a subset of a larger spatial prioritization project performed under contract to Australia's Department of Environment and Water Resources. It contains vector-based planning unit data and the distributions of 63 vegetation classes in Tasmania, Australia. Refer to the [Tasmania vignette](https://prioritizr.github.io/prioritizrdata/articles/tasmania.html) for a worked example with this dataset.
-   **Salt Spring Island dataset**: This dataset was included to provide an example of how prioritizations can be created using raster data. It was obtained as part of an online [Marxan-based planning tool](http://arcese.forestry.ubc.ca/marxan-tool) created for the Coastal Douglas-fir Conservation Partnership (CDFCP). It contains a raster-based planning unit layer and data for five key ecological communities in Salt Spring Island. Refer to the [Salt Spring Island vignette](https://prioritizr.github.io/prioritizrdata/articles/saltspring.html) for a worked example with this dataset.

Installation
------------

The latest official version of the *prioritizrdata R* package can be installed using the following *R* code.

``` r
install.packages("prioritizrdata", repos = "https://cran.rstudio.com/")
```

Alternatively, the latest development version can be installed using the following code. Please note that while developmental versions may contain additional features not present in the official version, they may also contain coding errors.

``` r
if (!require(devtools))
  install.packages("devtools")
devtools::install_github("prioritizr/prioritizrdata")
```

Citation
--------

Please using the following citation to cite the '*prioritizrdata R* package in publications:

Hanson JO, Schuster R, Morrell N, Strimas-Mackey M, Watts ME, Arcese P, Bennett J, Possingham HP (2018). prioritizrdata: Conservation planning data sets. R package version 0.2.1.2. <https://github.com/prioritizr/prioritizrdata>.
