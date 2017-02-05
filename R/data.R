#' @include internal.R
NULL

#' Tasmanian conservation planning scenario
#'
#' This scenario involves making a prioritsation to adequately conserve
#' the main types of vegetation found in Tasmania for minimal cost. To
#' acheive this goal, the scenario involves using the following data:
#' 
#' \describe{
#'   \item{\code{tas_pu}}{Planning unit data. The attribute table contains
#'     three columns containing unique identifiers ('ids'), unimproved land
#'     values ('cost'), and their existing level of protection ('status').
#'     Units with 50\% or more of their area contained in IUCN protected areas
#'     are associated with a status of 2, otherwise they are associated with a
#'     value of 0.}
#'   \item{\code{tas_features}}{The distribution of 63 vegetation 
#'     classes in Tasmania, Australia. Each layer in the  stack 
#'     represents a different vegetation class. For a given layer, 
#'     cells indicate the presence (value of 1) or absence (value of 0)
#'     of the vegetation class in an area.}
#' }
#'
#' @docType data
#'
#' @aliases tas_features tas_pu
#'
#' @usage data(tas_features)
#'
#' @usage data(tas_pu)
#'
#' @format \describe{
#'   \item{tas_features}{\code{\link[raster]{RasterStack-class}} object}
#'   \item{tas_pu}{\code{\link[sp]{SpatialPolygonsDataFrame}} object.}
#' }
#'
#' @keywords datasets
#'
#' @references This data was obtained from the "Introduction to Marxan" course
#'   (\url{http://marxan.net/courses}).
#'
#'
#' @examples
#' # load data
#' data(tas_pu, tas_features)
#'
#' # plot data
#' plot(tas_pu)
#' plot(tas_features)
#'
#' @name tas_data
NULL

