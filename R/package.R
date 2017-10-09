#' @include internal.R
NULL

#' prioritizrdata: Conservation planning data sets
#'
#' \emph{Prioritizrdata} is a supplemental package to \emph{prioritizr}
#' containing example datasets for conservation planning. The datasets and
#' tutorials in this package are intended  to be used alongside
#' \emph{prioritizr}, a package for solving systematic conservation
#' prioritization problems using integer linear programming (ILP) techniques.
#' Users can  refer to the vignettes built into the \emph{prioritizr} package
#' to familiarize themselves  with the basic usage of functions, and the
#' vignettes built into the \emph{prioritizrdata}  package for worked examples
#' with the example datasets. See the
#' \href{https://github.com/prioritizr}{online code repository} for more
#' details.
#'
#' @details There are two datasets in this package:
#'
#' \describe{
#'   \item{\code{\link{tas_data}}}{This data set was obtained from the
#'   \href{http://marxan.net/courses}{"Introduction to Marxan" course} and was
#'   originally part of a larger spatial prioritization performed under
#'   contract to Australia's Department of Environment and Water Resources.
#'    This data set contains vector-based planning unit data and data for the
#'    spatial distribution of 63 vegetation classes in Tasmania, Australia.
#'    Refer to the \href{inst/doc/tasmania.html}{Tasmania vignette} for a
#'    worked example with this dataset.}
#'
#'   \item{\code{\link{salt_data}}}{This dataset is from an
#'     online \href{http://arcese.forestry.ubc.ca/marxan-tool}{Marxan-based planning tool}
#'     created for the Coastal Douglas-fir Conservation Partnership (CDFCP). It
#'     contains raster-based planning unit data and the data for the spatial
#'     distributions of five key ecological communities in the area. Refer to
#'     the \href{inst/doc/saltspring.html}{Salt Spring Island vignette} for a
#'     worked example with this dataset}
#' }
#'
#' @name prioritizrdata
#'
#' @docType package
NULL
