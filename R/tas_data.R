#' Tasmania data
#'
#' Conservation planning dataset for Tasmania, Australia.
#'
#' @details
#' The following functions are provided to import data:
#'
#' \describe{
#'
#' \item{`get_tas_pu`}{Import planning unit data.
#'   The planing units are a [sf::st_sf()] simple features object.
#'   Each row corresponds to a different planning unit, and columns
#'   contain information about the planning units.
#'   It has columns that contain: (`"id"`) unique identifiers and
#'   (`"cost"`) unimproved land values for the planning units.
#'   It also contains columns (`"locked_in"` and `"locked_out"`)
#'   with `logical` values (i.e. `TRUE` or `FALSE` values)
#'   for locking in and locking out planning units.
#'   These data obtained from the
#'   ["Introduction to *Marxan*" course](https://marxansolutions.org/)
#'   and were originally generated as part of a larger spatial prioritization
#    performed under ontract to Australia's Department of Environment and Water
#'   Resources (Klein *et al.* 2007).}
#'
#' \item{`get_tas_features`}{Import biodiversity feature data.
#'   The feature data are a multi-layer [terra::rast()] object.
# '  It denotes the spatial distribution of 33 vegetation
#'   classes. Each layer corresponds to a
#'   different vegetation class and contains binary cell values that indicate
#'   the presence or absence of the vegetation class.
#'   These data were obtained from the Australian Government's National
#'   Vegetation Information System (Australian Government Department of Climate
#'   Change, Energy, the Environment and Water 2020).}
#'
#' }
#'
#' @docType data
#'
#' @aliases get_tas_features get_tas_pu
#' @aliases tas_features tas_pu
#'
#' @format \describe{
#'   \item{tas_pu}{[sf::st_sf()] object.}
#'   \item{tas_features}{[terra::rast()] object}
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
#' Australian Government Department of Climate Change, Energy, the Environment
#' and Water (2020). National Vegetation Information System. Version 6.0.
#' Available at <http://environment.gov.au/fed/catalog/search/resource/details.page?uuid=%7B3F8AD12F-8300-45EC-A41A-469519A94039%7D>.
#'
#' @examples
#' # load packages
#' library(terra)
#' library(sf)
#'
#' # load data
#' tas_pu <- get_tas_pu()
#' tas_features <- get_tas_features()
#'
#' # preview planning units
#' print(tas_pu)
#' plot(tas_pu)
#'
#' # plot features
#' print(tas_features)
#' plot(tas_features)
#'
#' @name tas_data
NULL

#' @rdname tas_data
#' @export
get_tas_pu <- function() {
  # find zip file with data
  f <- system.file("extdata", "tas_pu.gpkg.zip", package = "prioritizrdata")
  # unzip zip file to temporary directory
  td <- tempfile()
  dir.create(td, showWarnings = FALSE)
  utils::unzip(f, exdir = td)
  # import data
  o <- sf::read_sf(
    dir(td, "^.*\\.gpkg$", recursive = TRUE, full.names = TRUE)[[1]]
  )
  # clean up temporary directory
  unlink(td, force = TRUE, recursive = TRUE)
  # return result
  o
}

#' @rdname tas_data
#' @export
get_tas_features <- function() {
  x <- terra::rast(
    system.file("extdata", "tas_features.tif", package = "prioritizrdata")
  )
  names(x) <- c(
    "Banksia woodlands",
    "Boulders/rock with algae, lichen or scattered plants, or alpine fjaeldmarks",
    "Callitris forests and woodlands",
    "Cool temperate rainforest",
    "Eucalyptus (+/- tall) open forest with a dense broad-leaved and/or tree-fern understorey (wet sclerophyll)",
    "Eucalyptus open forests with a shrubby understorey",
    "Eucalyptus open woodlands with shrubby understorey",
    "Eucalyptus tall open forest with a fine-leaved shrubby understorey",
    "Eucalyptus tall open forests and open forests with ferns, herbs, sedges, rushes or wet tussock grasses",
    "Eucalyptus woodlands with a shrubby understorey",
    "Eucalyptus woodlands with a tussock grass understorey",
    "Eucalyptus woodlands with ferns, herbs, sedges, rushes or wet tussock grassland",
    "Freshwater, dams, lakes, lagoons or aquatic plants",
    "Heathlands",
    "Leptospermum forests and woodlands",
    "Low closed forest or tall closed shrublands (including Acacia, Melaleuca and Banksia)",
    "Mallee with a tussock grass understorey",
    "Melaleuca open forests and woodlands",
    "Melaleuca shrublands and open shrublands",
    "Mixed chenopod, samphire +/- forbs",
    "Naturally bare, sand, rock, claypan, mudflat",
    "Other Acacia tall open shrublands and shrublands",
    "Other forests and woodlands",
    "Other open woodlands",
    "Other shrublands",
    "Other tussock grasslands",
    "Regrowth or modified forests and woodlands",
    "Saline or brackish sedgelands or grasslands",
    "Salt lakes and lagoons",
    "Sedgelands, rushs or reeds",
    "Temperate tussock grasslands",
    "Unclassified native vegetation",
    "Wet tussock grassland with herbs, sedges or rushes, herblands or ferns"
  )
  x
}
