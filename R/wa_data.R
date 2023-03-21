#' Washington data
#'
#' Conservation planning dataset for Washington, The United States of America.
#'
#' @details
#' The following functions are provided to import data:
#'
#' \describe{
#'
#' \item{`get_wa_pu()`}{Import planning unit data.
#'   The planning units are a single layer [terra::rast()] object.
#'   Cell values denote land acquisition costs.
#'   These data were originally obtained from Nolte (2020 a,b).}
#'
#' \item{`get_wa_locked_in()`}{Import locked in data.
#'   The locked in data are a single layer [terra::rast()] object.
#'   Cell values denote binary values indicating if each cell
#'   is predominantly covered by protected areas
#'   (excluding those with no mandate for biodiversity protection).
#'   These data were originally obtained from USGS (2022)}
#'
#' \item{`get_wa_locked_in()`}{Import locked out data.
#'   The locked out are a single layer [terra::rast()] object.
#'   Cell values denote binary values indicating if each cell
#'   is predominantly covered by urban areas.
#'   These data were originally obtained from the
#'   Commission for Environmental Cooperation (2020)}
#'
#' \item{`get_wa_features()`}{Import biodiversity feature data.
#'   The feature data are a multi-layer
#'   [terra::rast()] object object.
#'   It contains the spatial distribution of 258 bird species.
#'   To account for migratory patterns, data are provided for the
#'   breeding and non-breeding distributions of species
#'   (indicated by `"breeding"` and `"non-breedig"` in the layer names).
#'   If a species is lacking such information,
#'   then the species is denoted with its full distribution
#'   (as indicated `"full"` in the layer names).
#'   These data were originally obtained from the eBird Status and Trends
#'   dataset (Fink _et al._ 2020).}
#' }
#'
#' @aliases get_wa_pu get_wa_locked_in get_wa_locked_out get_wa_features
#' @aliases wa_pu wa_locked_in wa_locked_out get_wa_features
#'
#' @format \describe{
#'   \item{get_wa_pu}{[terra::rast()] object.}
#'   \item{get_wa_locked_in}{[terra::rast()] object.}
#'   \item{get_wa_locked_out}{[terra::rast()] object.}
#'   \item{get_wa_features}{[terra::rast()] object.}
#' }
#'
#'
#' @keywords datasets
#'
#' @references
#' Commission for Environmental Cooperation. (2020). _2015 Land Cover
#' of North America at 30 Meters_. North American Land Change Monitoring
#' System, 2nd Edition, <http://cec.org/tools-and-resources/map-files/land-cover-30m-2015-landsat-and-rapideye\%20(accessed\%20January\%202021)>.
#'
#' Fink D, Auer T, Johnston A, Ruiz-Gutierrez V, Hochachka WM and
#' Kelling S (2020) Modeling avian full annual cycle distribution and
#' population trends with citizen science data.
#' _Ecological Applications_, 30: e02056.
#'
#' Nolte C (2020a) _Data for: High-resolution land value maps
#' reveal underestimation of conservation costs in the United States_.
#' Dryad, Dataset, <https://doi.org/10.5061/dryad.np5hqbzq9>.
#'
#' Nolte C (2020b) High-resolution land value maps reveal
#' underestimation of conservation costs in the United States.
#' _Proceedings of the National Academy of Sciences_, 117: 29577--29583.
#'
#' U.S. Geological Survey (USGS) Gap Analysis Project (GAP) (2022)
#' Protected Areas Database of the United States (PAD-US) 3.0: U.S. Geological
#' Survey data release, <https://doi.org/10.5066/P9Q9LQ4B>.
#'
#' @examples
#' # load packages
#' library(terra)
#'
#' # import data
#' wa_pu <- get_wa_pu()
#' wa_features <- get_wa_features()
#' wa_locked_in <- get_wa_locked_in()
#' wa_locked_out <- get_wa_locked_out()
#'
#' # preview planning units
#' print(wa_pu)
#' plot(wa_pu)
#"
#' # preview locked in
#' print(wa_locked_in)
#' plot(wa_locked_in)
#'

#' # preview locked out
#' print(wa_locked_out)
#' plot(wa_locked_out)
#'
#' # preview features
#' print(wa_features)
#' plot(wa_features)
#'
#' @name wa_data
NULL

#' @rdname wa_data
#' @export
get_wa_pu <- function() {
  x <- terra::rast(
    system.file("extdata", "wa_pu.tif", package = "prioritizrdata")
  )
  names(x) <- "cost"
  x
}

#' @rdname wa_data
#' @export
get_wa_locked_in <- function() {
  x <- terra::rast(
    system.file("extdata", "wa_locked_in.tif", package = "prioritizrdata")
  )
  names(x) <- "protected areas"
  x
}

#' @rdname wa_data
#' @export
get_wa_locked_out <- function() {
  x <- terra::rast(
    system.file("extdata", "wa_locked_out.tif", package = "prioritizrdata")
  )
  names(x) <- "urban areas"
  x
}

#' @rdname wa_data
#' @export
get_wa_features <- function() {
  x <- terra::rast(
    system.file("extdata", "wa_features.tif", package = "prioritizrdata")
  )
  names(x) <- readLines(
    system.file("extdata", "wa_features_names.txt", package = "prioritizrdata")
  )
  x
}
