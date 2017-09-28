#' @include internal.R
NULL

#' Saltspring Island conservation planning scenario
#'
#' This scenario involves making a prioritsation to adequately conserve
#' key ecological communities on Saltspring Island, British Columbia. For a worked example 
#' with this dataset, refer to the \code{SaltSpring} vignette. The 
#' scenario is intended to provide an example of how Raster-class input data can be used in 
#' \code{prioritizr}. 
#' 
#' @details
#' The dataset contains the following items:
#' 
#' \describe{
#'   \item{\code{salt_pu}}{Planning unit data. A single band raster-class object 
#'   where each one hectare pixel contains the corresponding monetary cost of 
#'   acquisition (BC Land Assessment 2015).}
#'   \item{\code{salt_features}}{Biodiversity feature data. The probability of occurrence 
#'   of five key ecological communities found on Salt Spring island. Each layer in the stack 
#'   represents a different community type. In order these are; Old Forest, Savannah, 
#'   Wetland, Shrub, and a layer representing the inverse probability of occurrence of 
#'   human commensal species. For a given layer, the cell value indicates the composite probability of 
#'   encountering the suite of bird species most commonly associated with that community type.}
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
#' @references This data was obtained as part of an online Marxan-based planning 
#' tool created for the Coastal Douglas-fir Conservation Partnership (CDFCP). For more information refer 
#' to \href{http://peter-arcese-lab.sites.olt.ubc.ca/files/2016/09/CDFCP_tutorial_2017_05.pdf}{Schuster et al. 2017}.  
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
