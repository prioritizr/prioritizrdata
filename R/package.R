#' @import raster
#' @import sp
NULL

#' prioritizrdata: Conservation Planning Data Sets
#'
#' The \pkg{prioritizrdata} package is a supplemental package that contains
#' example datasets for conservation planning. It is intended to be used
#' alongside the
#' \href{https://github.com/prioritizr/prioritizr}{\pkg{prioritizr} package}---a
#' package for building and solving systematic conservation prioritization
#' problems using integer linear programming (ILP) techniques---and provides
#' little functionality itself.
#'
#' @details This package contains the following datasets:
#'
#' \describe{
#'
#' \item{[tas_data]}{This data set was obtained from the
#'   ["Introduction to *Marxan*" course](http://marxan.net/courses)
#'   and was originally part of a larger spatial prioritization performed under
#'   contract to Australia's Department of Environment and Water Resources.
#'   This data set contains vector-based planning unit data and data for the
#'   spatial distribution of 62 vegetation classes in Tasmania, Australia.
#'   Refer to the [Tasmania vignette in the \pkg{prioritizr} package](https://cran.r-project.org/web/packages/prioritizr/vignettes/tasmania.html) for a
#'   worked example with this dataset.}
#'
#' \item{[salt_data]}{This dataset is from an
#'   online [*Marxan*-based planning tool](http://arcese.forestry.ubc.ca/marxan-tool)
#'   created for the Coastal Douglas-fir Conservation Partnership (CDFCP). It
#'   contains raster-based planning unit data and the data for the spatial
#'   distributions of five key ecological communities in the area. Refer to
#'   the [Salt Spring Island vignette in the \pkg{prioritizr} package](https://cran.r-project.org/web/packages/prioritizr/vignettes/saltspring.html) for a
#'   worked example with this dataset.}
#'
#' }
#'
#' @name prioritizrdata
#'
#' @docType package
NULL
