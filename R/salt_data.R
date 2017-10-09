#' @include internal.R
NULL

#' Salt Spring Island conservation planning data
#'
#' This data was obtained as part of an online Marxan-based planning
#' tool created for the Coastal Douglas-fir Conservation Partnership (CDFCP).
#' For more information refer to Schuster \emph{et al.} 2017. For a
#' worked example  with this dataset, refer to the
#' \href{inst/doc/saltspring.html}{Salt Spring vignette}. The scenario is
#' intended to provide an example of how raster planning unit data can be used #' in the \emph{prioritizr} package.
#'
#' @details
#' The dataset contains the following items:
#'
#' \describe{
#'
#'   \item{\code{salt_pu}}{Planning unit data. A single band
#'     \code{\link{RasterLayer-class}} object where each one hectare pixel
#'     contains the monetary cost of acquiring the area (BC Land Assessment
#'     2015).}
#'
#'   \item{\code{salt_features}}{Biodiversity feature data. The probability of
#'     occurrence commensal of five key ecological communities found on Salt
#'     Spring island. Each layer in the \code{\link{RasterStack-class}}
#'     object represents a different community type. These classes
#'     are old forest (1), savanna (2), wetland (3), shrub (4), and a
#'     layer representing the inverse probability of occurrence of human
#'     commensal species (5). For a given layer, the values indicate the
#'     composite probability of encountering the suite of bird species most
#'     commonly associated with that community type.}
#' }
#'
#' @docType data
#'
#' @aliases salt_features salt_pu
#'
#' @usage data(salt_features)
#'
#' @usage data(salt_pu)
#'
#' @format \describe{
#'   \item{salt_features}{\code{\link[raster]{RasterStack-class}} object}
#'   \item{salt_pu}{\code{\link[raster]{RasterLayer-class}} object.}
#' }
#'
#' @keywords datasets
#'
#' @references
#' BC Assessment (2015) Property Information Services. Available at
#' \url{http://www.bcassessment.ca} [Date Accessed 2016/06/13].
#'
#' Morrell N, Schuster R, Crombie M, and Arcese P (2017) \emph{A Prioritization
#' Tool for the Conservation of Coastal Douglas-fir Forest and Savannah
#' Habitats of the Georgia Basin.} The Nature Trust of British Colombia, Coastal
#' Douglas Fir Conservation Partnership, and the Department of Forest and
#' Conservation Sciences, University of British Colombia. Available at
#' \url{http://peter-arcese-lab.sites.olt.ubc.ca/files/2016/09/CDFCP_tutorial_2017_05.pdf} [Date Accessed 2017/10/09].
#'
#' @examples
#' # load data
#' data(salt_pu, salt_features)
#'
#' # plot data
#' plot(salt_pu)
#' plot(salt_features)
#'
#' @name salt_data
NULL

#' @rdname salt_data
"salt_pu"

#' @rdname salt_data
"salt_features"
