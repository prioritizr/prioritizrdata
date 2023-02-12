#' Salt Spring Island data
#'
#' Conservation planning dataset for Salt Spring Island, Canada.
#' It was obtained as part of an online *Marxan*-based planning
#' tool created for the Coastal Douglas-fir Conservation Partnership
#' (CDFCP; Schuster *et al.* 2017).
#'
#' @details
#' The following functions are provided to import data:
#'
#' \describe{
#'
#' \item{`get_salt_pu()`}{Import planning unit data.
#'   The planning units are  a single layer [terra::rast()] object.
#'   Cell values denote the monetary cost of acquiring different areas
#'   (e.g., a value of 1 = $100,000 CAD; BC Land Assessment
#'   2015).}
#'
#' \item{`get_salt_features()`}{Import biodiversity feature data.
#'   The feature data are a multi-layer
#'   [terra::rast()] object object.
#'   It contains the spatial distribution of four key ecological communities.
#'   Each layer represents a different community type.
#'   These classes are (i) old forest, (ii) savanna, (iii) wetland,
#'   and (iv) shrub. For each layer, values indicate the
#'   composite probability of encountering the suite of bird species most
#'   commonly associated with that community type.}
#'
#' \item{`get_salt_con()`}{Import connectivity data.
#'   The connectivity data are a single-layer
#'   [terra::rast()] object.
#'   It contains the inverse probability of occurrence of human
#'   commensal species.
#'   Based on the assumption that human modified areas
#'   impede connectivity for native fauna, cells with lower values
#'   have higher connectivity.}
#'
#' }
#'
#' @aliases get_salt_pu get_salt_features get_salt_con
#' @aliases salt_features salt_pu
#'
#' @format \describe{
#'   \item{salt_pu}{[terra::rast()] object.}
#'   \item{salt_features}{[terra::rast()] object.}
#'   \item{salt_con}{[terra::rast()] object.}
#' }
#'
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
#' # load packages
#' library(terra)
#' library(sf)
#'
#' # import data
#' salt_pu <- get_salt_pu()
#' salt_features <- get_salt_features()
#'
#' # preview planning units
#' print(salt_pu)
#' plot(salt_pu)
#'
#' # preview features
#' print(salt_features)
#' plot(salt_features)
#'
#' # preview connectivity data
#' salt_con <- get_salt_con()
#' print(salt_con)
#' plot(salt_con)
#'
#' @name salt_data
NULL

#' @rdname salt_data
#' @export
get_salt_pu <- function() {
  x <- terra::rast(
    system.file("extdata", "salt_pu.tif", package = "prioritizrdata")
  )
  names(x) <- "cost"
  x
}

#' @rdname salt_data
#' @export
get_salt_features <- function() {
  x <- terra::rast(
    system.file("extdata", "salt_features.tif", package = "prioritizrdata")
  )
  names(x) <- c("old forest", "savanna", "wetland", "shrub")
  x
}

#' @rdname salt_data
#' @export
get_salt_con <- function() {
  x <- terra::rast(
    system.file("extdata", "salt_con.tif", package = "prioritizrdata")
  )
  names(x) <- "inverse human"
  x
}
