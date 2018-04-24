#' @include internal.R
NULL

#' Tasmanian conservation planning data
#'
#' This data set was obtained from the
#' \href{http://marxan.net/courses}{"Introduction to \emph{Marxan}" course}
#' and was originally part of a larger spatial prioritization performed under
#' contract to Australia's Department of Environment and Water Resources.
#'
#' @details The data set contains the following items:
#'
#' \describe{
#'
#'   \item{\code{tas_pu}}{Planning unit data. The attribute table has
#'     three columns containing unique identifiers ("ids"), unimproved land
#'     values ("cost"), and their existing level of protection ("status").
#'     Units with 50 \% or more of their area contained in protected areas
#'     are associated with a status of 2, otherwise they are associated with a
#'     value of 0.}
#'
#'   \item{\code{tas_features}}{The distribution of 62 vegetation
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

#' @rdname tas_data
"tas_pu"

#' @rdname tas_data
"tas_features"
