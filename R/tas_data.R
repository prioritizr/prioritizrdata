#' Tasmania data
#'
#' This dataset was obtained from the
#' ["Introduction to *Marxan*" course](https://marxansolutions.org/)
#' and was originally part of a larger spatial prioritization performed under
#' contract to Australia's Department of Environment and Water Resources
#' (Klein *et al.* 2007). For a worked example with this
#' dataset, refer to the [Tasmania vignette in the \pkg{prioritizr} package](https://CRAN.R-project.org/package=prioritizr/vignettes/tasmania.html).
#'
#' @details The dataset contains the following items:
#'
#' \describe{
#'
#'   \item{`tas_pu`}{Planning unit data. The attribute table has
#'     three columns containing unique identifiers (`"id"`),
#'     unimproved land values (`"cost"`), and their existing level of
#'     protection (`"status"`). Units with 50% or more of their area
#'     contained in protected areas are associated with a status of 2,
#'     otherwise they are associated with a value of 0.
#'     It also contains columns (`"locked_in"` and `"locked_out"`)
#'     with `logical` values (i.e. `TRUE` or `FALSE` values)
#'     for locking in and locking out planning units.}
#'
#'   \item{`tas_features`}{The distribution of 62 vegetation
#'     classes in Tasmania, Australia. Each layer in the stack
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
#'   \item{tas_features}{[`RasterStack-class`] object}
#'   \item{tas_pu}{[sp::SpatialPolygonsDataFrame()] object.}
#' }
#'
#' @keywords datasets
#'
#' @references
#' Klein C, Carwardine J, Wilson K, Watts M, and Possingham H (2007) *Spatial
#' Prioritization Approaches for the Conservation of Biodiversity in
#' Australia: Considering Conservation Costs, Ecological & Evolutionary
#' Processes, and Large-Intact Areas.* Report to the Department of
#' Environment; Water Resources.
#'
#' @examples
#' # load data
#' data(tas_pu, tas_features)
#'
#' # preview data
#' print(tas_pu)
#' print(tas_features)
#'
#' # plot data
#' plot(tas_pu)
#' plot(tas_features)
#'
#' @name tas_data
NULL
