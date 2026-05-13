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
#'   The locked out data are a single layer [terra::rast()] object.
#'   Cell values denote binary values indicating if each cell
#'   is predominantly covered by urban areas.
#'   These data were originally obtained from the
#'   Commission for Environmental Cooperation (2020)}
#'
#' \item{`get_wa_carbon()`}{Import vulnerable carbon data.
#'   The carbon data a single layer [terra::rast()] object.
#'   Cell values denote continuous values representing the amount
#'   of carbon sequestered that is vulnerable to be released through
#'   typical land-use conversion.
#'   These data were originally obtained from the
#'   Noon _et al._ (2021, 2022)}
#'
#' \item{`get_wa_features()`}{Import biodiversity feature data.
#'   The feature data are a multi-layer
#'   [terra::rast()] object.
#'   It contains the spatial distribution of 258 bird species.
#'   To account for migratory patterns, data are provided for the
#'   breeding and non-breeding distributions of species
#'   (indicated by `"breeding"` and `"non-breeding"` in the layer names).
#'   If a species is lacking such information,
#'   then the species is denoted with its full distribution
#'   (as indicated `"full"` in the layer names).
#'   These data were originally obtained from the eBird Status and Trends
#'   dataset (Fink _et al._ 2020).}
#'
#' \item{`get_wa_attr()`}{Import attribute data about the biodiversity features.
#'   The feature attribute data are a data frame ([tibble::tibble()]) object.
#'   It contains taxonomic information for each feature
#'   (i.e., layer in `get_wa_features()`) as well as estimates of
#'   public interest (derived from Mittermeier _et al._ 2021) and
#'   extinction risk (based on the methodology of Davis _et al._ 2018 and
#'   and threat status classification data from IUCN 2025).
#'   Since Mittermeier _et al._ (2021)
#'   did not contain public interest scores for all features,
#'   scores were interpolated for features missing scores based on average
#'   public interest score of features that belong to the same
#'   taxonomic family. This object has the following columns:
#'   \describe{
#'   \item{feature}{Name of the feature (i.e., `per get_wa_features()`).}
#'   \item{binomial}{Taxonomic species and genus name of the feature.}
#'   \item{family}{Taxonomic family name of the feature.}
#'   \item{order}{Taxonomic order of the feature.}
#'   \item{extinction_prob}{Probability of extinction.}
#'   \item{interest_score}{Public interest score.}
#'   }}
#' }
#'
#' @aliases get_wa_pu get_wa_locked_in get_wa_locked_out get_wa_features
#' @aliases get_wa_attr get_wa_carbon
#' @aliases wa_pu wa_locked_in wa_locked_out get_wa_features
#' @aliases wa_weights wa_carbon
#'
#' @format \describe{
#'   \item{get_wa_pu}{[terra::rast()] object.}
#'   \item{get_wa_locked_in}{[terra::rast()] object.}
#'   \item{get_wa_locked_out}{[terra::rast()] object.}
#'   \item{get_wa_carbon}{[terra::rast()] object.}
#'   \item{get_wa_features}{[terra::rast()] object.}
#'   \item{get_wa_attr}{[tibble::tibble()] object.}
#' }
#'
#'
#' @keywords datasets
#'
#' @references
#' Commission for Environmental Cooperation. (2020). _2015 Land Cover
#' of North America at 30 Meters_. North American Land Change Monitoring
#' System, 2nd Edition, <http://www.cec.org/north-american-environmental-atlas/land-cover-30m-2015-landsat-and-rapideye/>.
#'
#' Davis M, Faurby S, and Svenning J-C (2018) Mammal diversity will take
#' millions of years to recover from the current biodiversity crisis.
#' _Proceedings of the National Academy of Sciences_, 115: 11262--11267.
#'
#' Fink D, Auer T, Johnston A, Ruiz-Gutierrez V, Hochachka WM and
#' Kelling S (2020) Modeling avian full annual cycle distribution and
#' population trends with citizen science data.
#' _Ecological Applications_, 30: e02056.
#'
#' IUCN (2025) The IUCN Red List of Threatened Species. Version 2025-2.
#' <https://www.iucnredlist.org>. Accessed on 13 May 2026.
#'
#' Mittermeier JC, Roll U, Matthews TJ, Correia R, and Grenyer R (2021)
#' Birds that are more commonly encountered in the wild attract higher public
#' interest online. _Conservation Science and Practice_, 3: e340.
#'
#' Nolte C (2020a) _Data for: High-resolution land value maps
#' reveal underestimation of conservation costs in the United States_.
#' Dryad, Dataset, \doi{10.5061/dryad.np5hqbzq9}.
#'
#' Nolte C (2020b) High-resolution land value maps reveal
#' underestimation of conservation costs in the United States.
#' _Proceedings of the National Academy of Sciences_, 117: 29577--29583.
#'
#' Noon ML, Goldstein A, Ledezma JC, Roehrdanz PR, Cook-Patton SC,
#' Spawn-Lee SA, Wright TM, Gonzalez-Roglich M, Hole DG, Rockström J, and
#' Turner WR (2022) Mapping the irrecoverable carbon in Earth's ecosystems.
#' _Nature Sustainability_, 5: 37--46.
#'
#' Noon ML, Goldstein A, Ledezma JC, Roehrdanz PR, Cook-Patton SC,
#' Spawn-Lee SA, Wright TM, Gonzalez-Roglich M, Hole DG, Rockström J, and
#' Turner WR (2021) Mapping the irrecoverable carbon in Earth's ecosystems
#' (2.0) \[Data set\]. Zenodo. \doi{10.5281/zenodo.4091029}.
#'
#' U.S. Geological Survey (USGS) Gap Analysis Project (GAP) (2022)
#' Protected Areas Database of the United States (PAD-US) 3.0: U.S. Geological
#' Survey data release, \doi{10.5066/P9Q9LQ4B}.
#'
#' @examples
#' # load packages
#' library(terra)
#'
#' # import data
#' wa_pu <- get_wa_pu()
#' wa_features <- get_wa_features()
#' wa_attr <- get_wa_attr()
#' wa_locked_in <- get_wa_locked_in()
#' wa_locked_out <- get_wa_locked_out()
#' wa_carbon <- get_wa_carbon()
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
#' # preview attributes of features
#' print(wa_attr)
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

#' @rdname wa_data
#' @export
get_wa_attr <- function() {
  tibble::as_tibble(
    readRDS(
      system.file("extdata", "wa_attr_data.rds", package = "prioritizrdata")
    )
  )
}

#' @rdname wa_data
#' @export
get_wa_carbon <- function() {
  x <- terra::rast(
    system.file("extdata", "wa_carbon.tif", package = "prioritizrdata")
  )
  names(x) <- "vulnerable carbon"
  x
}
