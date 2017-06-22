#' @include internal.R
NULL

#' prioritizrdata: Conservation planning data sets
#'
#' \emph{Prioritizrdata} is a supplemental package to \emph{prioritizr} containing example 
#' datasets for conservation planning. The datasets and tutorials in this package are intended 
#' to be used alongside \emph{prioritizr}, a package for solving systematic conservation 
#' prioritization problems using integer linear programming (ILP) techniques. Users can 
#' refer to the vignettes built into the \emph{prioritizr} package to familiarize themselves 
#' with the basic usage of functions, and the vignettes built into the \emph{prioritizrdata} 
#' package for worked examples with the example datasets.
#'  
#' See the \href{https://github.com/prioritizr}{github repository} for more details.
#' 
#' @details
#' 
#' There are two datasets in this package: 
#' 
#' \describe{
#'   \item{\code{\link{tas_data}}}{Tasmania dataset. This dataset was included to provide an example of vector 
#'   shapefile inputs to conservation planning problems. The dataset was obtained from the 
#'   \href{http://marxan.net/courses}{"Introduction to Marxan" course} and was originally a 
#'   subset of a larger spatial prioritization project performed under contract to Australia's 
#'   Department of Environment and Water Resources. Contained within this dataset is 
#'   one planning unit layer and one features layer with the distributions of 63 
#'   vegetation classes in Tasmania, Australia. Refer to the \href{docs/tasmania.html}{Tasmania vignette} 
#'   for a worked example with this dataset.}
#'   \item{\code{\link{salt_data}}}{Salt Spring Island dataset. This dataset was included to provide an 
#'   example of raster inputs to conservation planning problems. It was obtained as part of an online 
#'   \href{http://arcese.forestry.ubc.ca/marxan-tool}{Marxan-based planning tool} created for the 
#'   Coastal Douglas-fir Conservation Partnership (CDFCP). Contained within this dataset is one planning 
#'   unit raster layer and one raster stack with the distributions of five key ecological communities. 
#'   Refer to the \href{docs/saltspring.html}{Salt Spring Island vignette} for a worked example with this 
#'   dataset}
#' }
#'
#' @name prioritizrdata
#' @docType package
NULL
