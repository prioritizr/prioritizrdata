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
#'   It contains the spatial distribution of 247 bird species.
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
  names(x) <- c(
    "American Avocet (breeding)",
    "American Bittern (breeding)",
    "American Bittern (nonbreeding)",
    "American Crow (breeding)",
    "American Crow (nonbreeding)",
    "American Dipper (full)",
    "American Goldfinch (breeding)",
    "American Goldfinch (nonbreeding)",
    "American Kestrel (breeding)",
    "American Kestrel (nonbreeding)",
    "American Pipit (breeding)",
    "American Pipit (nonbreeding)",
    "American Redstart (breeding)",
    "American Robin (breeding)",
    "American Robin (nonbreeding)",
    "American Wigeon (breeding)",
    "American Wigeon (nonbreeding)",
    "American Tree Sparrow (nonbreeding)",
    "American White Pelican (breeding)",
    "American White Pelican (nonbreeding)",
    "Anna's Hummingbird (breeding)",
    "Anna's Hummingbird (nonbreeding)",
    "Ash-throated Flycatcher (breeding)",
    "American Three-toed Woodpecker (full)",
    "Bald Eagle (breeding)",
    "Bald Eagle (nonbreeding)",
    "Bank Swallow (breeding)",
    "Barrow's Goldeneye (breeding)",
    "Barrow's Goldeneye (nonbreeding)",
    "Barn Swallow (breeding)",
    "Barn Swallow (nonbreeding)",
    "Band-tailed Pigeon (breeding)",
    "Band-tailed Pigeon (nonbreeding)",
    "Black-crowned Night-Heron (breeding)",
    "Black-crowned Night-Heron (nonbreeding)",
    "Belted Kingfisher (breeding)",
    "Belted Kingfisher (nonbreeding)",
    "Bewick's Wren (breeding)",
    "Bewick's Wren (nonbreeding)",
    "Black-billed Magpie (full)",
    "Black-bellied Plover (breeding)",
    "Black-bellied Plover (nonbreeding)",
    "Black-backed Woodpecker (full)",
    "Black-capped Chickadee (full)",
    "Black-headed Grosbeak (breeding)",
    "Black-necked Stilt (breeding)",
    "Black Oystercatcher (breeding)",
    "Black Oystercatcher (nonbreeding)",
    "Black Scoter (breeding)",
    "Black Scoter (nonbreeding)",
    "Black Tern (breeding)",
    "Black Turnstone (nonbreeding)",
    "Brown-headed Cowbird (breeding)",
    "Brown-headed Cowbird (nonbreeding)",
    "Bobolink (breeding)",
    "Bohemian Waxwing (nonbreeding)",
    "Bonaparte's Gull (breeding)",
    "Bonaparte's Gull (nonbreeding)",
    "Boreal Chickadee (full)",
    "Brandt's Cormorant (full)",
    "Brant (breeding)",
    "Brant (nonbreeding)",
    "Barred Owl (full)",
    "Brewer's Blackbird (breeding)",
    "Brewer's Blackbird (nonbreeding)",
    "Brewer's Sparrow (breeding)",
    "Brown Creeper (breeding)",
    "Brown Creeper (nonbreeding)",
    "Barn Owl (full)",
    "Brown Pelican (breeding)",
    "Brown Pelican (nonbreeding)",
    "Black-throated Gray Warbler (breeding)",
    "Bufflehead (breeding)",
    "Bufflehead (nonbreeding)",
    "Bullock's Oriole (breeding)",
    "Burrowing Owl (breeding)",
    "Bushtit (full)",
    "Blue-winged Teal (breeding)",
    "Cackling Goose (breeding)",
    "Cackling Goose (nonbreeding)",
    "California Gull (breeding)",
    "California Gull (nonbreeding)",
    "Calliope Hummingbird (breeding)",
    "California Quail (full)",
    "Canada Goose (breeding)",
    "Canada Goose (nonbreeding)",
    "Canvasback (breeding)",
    "Canvasback (nonbreeding)",
    "Canyon Wren (full)",
    "Cassin's Finch (breeding)",
    "Cassin's Finch (nonbreeding)",
    "Caspian Tern (breeding)",
    "Cassin's Vireo (breeding)",
    "Cedar Waxwing (breeding)",
    "Cedar Waxwing (nonbreeding)",
    "Chestnut-backed Chickadee (full)",
    "Chipping Sparrow (breeding)",
    "Chukar (full)",
    "Cinnamon Teal (breeding)",
    "Cinnamon Teal (nonbreeding)",
    "Clark's Grebe (breeding)",
    "Clark's Grebe (nonbreeding)",
    "Clark's Nutcracker (full)",
    "Clay-colored Sparrow (breeding)",
    "Clay-colored Sparrow (nonbreeding)",
    "Cliff Swallow (breeding)",
    "Common Goldeneye (breeding)",
    "Common Goldeneye (nonbreeding)",
    "Common Loon (breeding)",
    "Common Loon (nonbreeding)",
    "Common Merganser (breeding)",
    "Common Merganser (nonbreeding)",
    "Common Raven (full)",
    "Common Redpoll (nonbreeding)",
    "Common Tern (breeding)",
    "Common Yellowthroat (breeding)",
    "Common Yellowthroat (nonbreeding)",
    "Cooper's Hawk (breeding)",
    "Cooper's Hawk (nonbreeding)",
    "Cordilleran Flycatcher (breeding)",
    "California Scrub-Jay (full)",
    "Dark-eyed Junco (breeding)",
    "Dark-eyed Junco (nonbreeding)",
    "Double-crested Cormorant (breeding)",
    "Double-crested Cormorant (nonbreeding)",
    "Downy Woodpecker (full)",
    "Dusky Flycatcher (breeding)",
    "Eared Grebe (breeding)",
    "Eared Grebe (nonbreeding)",
    "Eastern Kingbird (breeding)",
    "Eurasian Collared-Dove (full)",
    "European Starling (full)",
    "Evening Grosbeak (breeding)",
    "Evening Grosbeak (nonbreeding)",
    "Ferruginous Hawk (breeding)",
    "Ferruginous Hawk (nonbreeding)",
    "Forster's Tern (breeding)",
    "Fox Sparrow (breeding)",
    "Fox Sparrow (nonbreeding)",
    "Gadwall (breeding)",
    "Gadwall (nonbreeding)",
    "Gray-crowned Rosy-Finch (breeding)",
    "Gray-crowned Rosy-Finch (nonbreeding)",
    "Glaucous Gull (nonbreeding)",
    "Glaucous-winged Gull (breeding)",
    "Glaucous-winged Gull (nonbreeding)",
    "Green-tailed Towhee (breeding)",
    "Green-winged Teal (breeding)",
    "Green-winged Teal (nonbreeding)",
    "Golden-crowned Kinglet (breeding)",
    "Golden-crowned Kinglet (nonbreeding)",
    "Golden-crowned Sparrow (nonbreeding)",
    "Grasshopper Sparrow (breeding)",
    "Great Blue Heron (breeding)",
    "Great Blue Heron (nonbreeding)",
    "Great Egret (breeding)",
    "Great Egret (nonbreeding)",
    "Greater Scaup (breeding)",
    "Greater Scaup (nonbreeding)",
    "Greater Yellowlegs (breeding)",
    "Greater Yellowlegs (nonbreeding)",
    "Great Horned Owl (full)",
    "Green Heron (breeding)",
    "Green Heron (nonbreeding)",
    "Gray Catbird (breeding)",
    "Gray Flycatcher (breeding)",
    "Gray Flycatcher (nonbreeding)",
    "Canada Jay (full)",
    "Gray Partridge (full)",
    "Greater White-fronted Goose (breeding)",
    "Greater White-fronted Goose (nonbreeding)",
    "Hairy Woodpecker (full)",
    "Hammond's Flycatcher (breeding)",
    "Harlequin Duck (breeding)",
    "Harlequin Duck (nonbreeding)",
    "Heermann's Gull (breeding)",
    "Heermann's Gull (nonbreeding)",
    "Herring Gull (breeding)",
    "Herring Gull (nonbreeding)",
    "Hermit Thrush (breeding)",
    "Hermit Thrush (nonbreeding)",
    "Hermit Warbler (breeding)",
    "Hooded Merganser (breeding)",
    "Hooded Merganser (nonbreeding)",
    "Horned Grebe (breeding)",
    "Horned Grebe (nonbreeding)",
    "Horned Lark (breeding)",
    "Horned Lark (nonbreeding)",
    "House Finch (full)",
    "House Sparrow (full)",
    "House Wren (breeding)",
    "Hutton's Vireo (full)",
    "Killdeer (breeding)",
    "Killdeer (nonbreeding)",
    "Lapland Longspur (nonbreeding)",
    "Lark Sparrow (breeding)",
    "Lazuli Bunting (breeding)",
    "Least Flycatcher (breeding)",
    "Lesser Goldfinch (breeding)",
    "Lesser Goldfinch (nonbreeding)",
    "Lesser Scaup (breeding)",
    "Lesser Scaup (nonbreeding)",
    "Lesser Yellowlegs (breeding)",
    "Lewis's Woodpecker (breeding)",
    "Lewis's Woodpecker (nonbreeding)",
    "Lincoln's Sparrow (breeding)",
    "Lincoln's Sparrow (nonbreeding)",
    "Long-billed Curlew (breeding)",
    "Long-billed Dowitcher (breeding)",
    "Long-billed Dowitcher (nonbreeding)",
    "Loggerhead Shrike (breeding)",
    "Long-tailed Duck (nonbreeding)",
    "MacGillivray's Warbler (breeding)",
    "Mallard (breeding)",
    "Mallard (nonbreeding)",
    "Marbled Godwit (breeding)",
    "Marbled Godwit (nonbreeding)",
    "Marbled Murrelet (breeding)",
    "Marbled Murrelet (nonbreeding)",
    "Marsh Wren (breeding)",
    "Marsh Wren (nonbreeding)",
    "Merlin (breeding)",
    "Merlin (nonbreeding)",
    "Mew Gull (breeding)",
    "Mew Gull (nonbreeding)",
    "Mountain Bluebird (breeding)",
    "Mountain Bluebird (nonbreeding)",
    "Mountain Chickadee (full)",
    "Mourning Dove (breeding)",
    "Mourning Dove (nonbreeding)",
    "Mountain Quail (full)",
    "Nashville Warbler (breeding)",
    "Northern Pygmy-Owl (full)",
    "Northwestern Crow (full)",
    "Northern Flicker (breeding)",
    "Northern Flicker (nonbreeding)",
    "Northern Harrier (breeding)",
    "Northern Harrier (nonbreeding)",
    "Northern Pintail (breeding)",
    "Northern Pintail (nonbreeding)",
    "Northern Shoveler (breeding)",
    "Northern Shoveler (nonbreeding)",
    "Northern Waterthrush (breeding)",
    "Northern Waterthrush (nonbreeding)",
    "Northern Rough-winged Swallow (breeding)",
    "Northern Saw-whet Owl (breeding)",
    "Northern Saw-whet Owl (nonbreeding)",
    "Olive-sided Flycatcher (breeding)",
    "Orange-crowned Warbler (breeding)",
    "Orange-crowned Warbler (nonbreeding)",
    "Osprey (breeding)",
    "Pacific Wren (breeding)",
    "Pacific Wren (nonbreeding)",
    "Pacific-slope Flycatcher (breeding)",
    "Pelagic Cormorant (full)",
    "Pied-billed Grebe (breeding)",
    "Pied-billed Grebe (nonbreeding)",
    "Pigeon Guillemot (breeding)",
    "Pigeon Guillemot (nonbreeding)",
    "Pileated Woodpecker (full)",
    "Pine Siskin (breeding)",
    "Pine Siskin (nonbreeding)",
    "Prairie Falcon (breeding)",
    "Prairie Falcon (nonbreeding)",
    "Purple Finch (breeding)",
    "Purple Finch (nonbreeding)",
    "Pygmy Nuthatch (full)",
    "Red-breasted Merganser (breeding)",
    "Red-breasted Merganser (nonbreeding)",
    "Red-breasted Nuthatch (breeding)",
    "Red-breasted Nuthatch (nonbreeding)",
    "Red-breasted Sapsucker (breeding)",
    "Red-breasted Sapsucker (nonbreeding)",
    "Red Crossbill (breeding)",
    "Red Crossbill (nonbreeding)",
    "Redhead (breeding)",
    "Redhead (nonbreeding)",
    "Red-necked Grebe (breeding)",
    "Red-necked Grebe (nonbreeding)",
    "Red-naped Sapsucker (breeding)",
    "Red-naped Sapsucker (nonbreeding)",
    "Red-tailed Hawk (breeding)",
    "Red-tailed Hawk (nonbreeding)",
    "Red-throated Loon (breeding)",
    "Red-throated Loon (nonbreeding)",
    "Red-winged Blackbird (breeding)",
    "Red-winged Blackbird (nonbreeding)",
    "Ring-billed Gull (breeding)",
    "Ring-billed Gull (nonbreeding)",
    "Ring-necked Duck (breeding)",
    "Ring-necked Duck (nonbreeding)",
    "Ring-necked Pheasant (full)",
    "Rock Pigeon (full)",
    "Rock Wren (breeding)",
    "Rock Wren (nonbreeding)",
    "Ruby-crowned Kinglet (breeding)",
    "Ruby-crowned Kinglet (nonbreeding)",
    "Ruddy Duck (breeding)",
    "Ruddy Duck (nonbreeding)",
    "Ruddy Turnstone (breeding)",
    "Ruddy Turnstone (nonbreeding)",
    "Ruffed Grouse (full)",
    "Rufous Hummingbird (breeding)",
    "Greater Sage-Grouse (full)",
    "Sagebrush Sparrow (breeding)",
    "Sage Thrasher (breeding)",
    "Sandhill Crane (breeding)",
    "Sandhill Crane (nonbreeding)",
    "Savannah Sparrow (breeding)",
    "Savannah Sparrow (nonbreeding)",
    "Say's Phoebe (breeding)",
    "Say's Phoebe (nonbreeding)",
    "Semipalmated Plover (breeding)",
    "Semipalmated Plover (nonbreeding)",
    "Sharp-tailed Grouse (full)",
    "Snow Bunting (nonbreeding)",
    "Snow Goose (breeding)",
    "Snow Goose (nonbreeding)",
    "Snowy Plover (breeding)",
    "Snowy Plover (nonbreeding)",
    "Solitary Sandpiper (breeding)",
    "Song Sparrow (breeding)",
    "Song Sparrow (nonbreeding)",
    "Sooty Grouse (full)",
    "Sora (breeding)",
    "Sora (nonbreeding)",
    "Spotted Sandpiper (breeding)",
    "Spotted Sandpiper (nonbreeding)",
    "Spotted Towhee (breeding)",
    "Spotted Towhee (nonbreeding)",
    "Steller's Jay (full)",
    "Surf Scoter (breeding)",
    "Surf Scoter (nonbreeding)",
    "Swainson's Hawk (breeding)",
    "Swainson's Thrush (breeding)",
    "Townsend's Solitaire (breeding)",
    "Townsend's Solitaire (nonbreeding)",
    "Townsend's Warbler (breeding)",
    "Townsend's Warbler (nonbreeding)",
    "Tree Swallow (breeding)",
    "Tree Swallow (nonbreeding)",
    "Tricolored Blackbird (full)",
    "Trumpeter Swan (breeding)",
    "Trumpeter Swan (nonbreeding)",
    "Tundra Swan (breeding)",
    "Tundra Swan (nonbreeding)",
    "Turkey Vulture (breeding)",
    "Turkey Vulture (nonbreeding)",
    "Varied Thrush (breeding)",
    "Varied Thrush (nonbreeding)",
    "Vaux's Swift (breeding)",
    "Vesper Sparrow (breeding)",
    "Violet-green Swallow (breeding)",
    "Virginia Rail (breeding)",
    "Virginia Rail (nonbreeding)",
    "Warbling Vireo (breeding)",
    "Western Bluebird (breeding)",
    "Western Bluebird (nonbreeding)",
    "Western Grebe (breeding)",
    "Western Grebe (nonbreeding)",
    "Western Gull (full)",
    "Western Kingbird (breeding)",
    "Western Meadowlark (breeding)",
    "Western Meadowlark (nonbreeding)",
    "Western Screech-Owl (full)",
    "Western Sandpiper (breeding)",
    "Western Sandpiper (nonbreeding)",
    "Western Tanager (breeding)",
    "Western Tanager (nonbreeding)",
    "Western Wood-Pewee (breeding)",
    "White-breasted Nuthatch (full)",
    "White-crowned Sparrow (breeding)",
    "White-crowned Sparrow (nonbreeding)",
    "White-headed Woodpecker (full)",
    "White-throated Sparrow (nonbreeding)",
    "White-throated Swift (breeding)",
    "White-winged Crossbill (breeding)",
    "White-winged Crossbill (nonbreeding)",
    "White-winged/Stejneger's Scoter (breeding)",
    "White-winged/Stejneger's Scoter (nonbreeding)",
    "Willow Flycatcher (breeding)",
    "Wilson's Phalarope (breeding)",
    "Williamson's Sapsucker (breeding)",
    "Wilson's Snipe (breeding)",
    "Wilson's Snipe (nonbreeding)",
    "Wild Turkey (full)",
    "Wilson's Warbler (breeding)",
    "Wilson's Warbler (nonbreeding)",
    "Wood Duck (breeding)",
    "Wood Duck (nonbreeding)",
    "American Coot (breeding)",
    "American Coot (nonbreeding)",
    "Iceland Gull (nonbreeding)",
    "Yellow-breasted Chat (breeding)",
    "Yellow-headed Blackbird (breeding)",
    "Yellow-headed Blackbird (nonbreeding)",
    "Yellow Warbler (breeding)",
    "Yellow Warbler (nonbreeding)",
    "Yellow-rumped Warbler (breeding)",
    "Yellow-rumped Warbler (nonbreeding)"
  )
  x
}
