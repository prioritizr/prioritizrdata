#' Salt Spring Island data
#'
#' This data was obtained as part of an online *Marxan*-based planning
#' tool created for the Coastal Douglas-fir Conservation Partnership
#' (CDFCP; Schuster *et al.* 2017). For a worked example with this
#' dataset, refer to the [Salt Spring vignette in the \pkg{prioritizr} package](https://CRAN.R-project.org/package=prioritizr/vignettes/saltspring.html).
#'
#' @details
#' The dataset contains the following items:
#'
#' \describe{
#'
#'   \item{`salt_pu`}{Planning unit data. A single band
#'     [`RasterLayer-class`] object where each one hectare pixel
#'     describes the monetary cost of acquiring the area
#'     (i.e. a pixel value of 1 = $100,000 CAD; BC Land Assessment
#'     2015).}
#'
#'   \item{`salt_features`}{Biodiversity feature data. A multi-band
#'     [`RasterStack-class`] object object containing the the probability of
#'     occurrence for five key ecological communities found on Salt
#'     Spring island. Each layer represents a different community type.
#'     These classes are old forest (1), savanna (2), wetland (3), shrub (4),
#'     and a layer representing the inverse probability of occurrence of human
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
#'   \item{salt_features}{[`RasterStack-class`] object.}
#'   \item{salt_pu}{[`RasterLayer-class`] object.}
#' }
#'
#' @keywords datasets
#'
#' @references
#' BC Assessment (2015) Property Information Services. Available at
#' <https://www.bcassessment.ca> (Date Accessed 2016/06/13).
#'
#' Morrell N, Schuster R, Crombie M, and Arcese P (2017) *A Prioritization
#' Tool for the Conservation of Coastal Douglas-fir Forest and Savannah
#' Habitats of the Georgia Basin.* The Nature Trust of British Colombia, Coastal
#' Douglas Fir Conservation Partnership, and the Department of Forest and
#' Conservation Sciences, University of British Colombia. Available at
#' <http://peter-arcese-lab.sites.olt.ubc.ca/files/2016/09/CDFCP_tutorial_2017_05.pdf> (Date Accessed 2017/10/09).
#'
#' @examples
#' # load data
#' data(salt_pu, salt_features)
#'
#' # preview data
#' print(salt_pu)
#' print(salt_features)
#'
#' # plot data
#' plot(salt_pu)
#' plot(salt_features)
#'
#' @name salt_data
NULL
