# Initialization
## load packages
devtools::load_all()
library(terra)
library(readr)
library(dplyr)
library(stringr)
library(rredlist)
library(readxl)
library(piggyback)

## define functions
run <- function() source("inst/scripts/prep_wa_extra_data.R")

fetch_file <- function(x, repo, dest, tag = NULL, show_progress = TRUE,
                      n_attempts = 100, wait = 60) {
  # initialization
  path <- paste0(dest, "/", x)
  counter <- 0
  # main loop
  while(!file.exists(path) && (counter < n_attempts)) {
    # increment counter
    counter <- counter + 1
    # print attempt number
    message("Starting attempt ", counter)
    # try to download file
    res <- withr::with_options(
      list(warn = 2),
      try(
        piggyback::pb_download(
          x, repo = repo, dest = dest, tag = tag,
          show_progress = show_progress
        )
      )
    )
    # if download fails...
    if (inherits(res, "try-error")) {
      ## delete partially or incorrectly downloaded file
      try(unlink(path, force = TRUE))
      ## wait a bit before trying again
      Sys.sleep(wait)
    }
  }

  # check if success
  if (!file.exists(path)) {
    stop("Failed to download file.")
  }

  # return success
  invisible(TRUE)
}

## set httr config for downloading files
### this is important to help avoid timeout issues with GitHub API
httr::set_config(
  httr::config(
    http_version = 2,
    connecttimeout = 60 * 60,
    timeout = 60 * 60,
    # ignore_content_length = 1,
    low_speed_limit = 0,
    low_speed_time = 60 * 60
  )
)

## fetch data
fetch_file(
  "csp2340-sup-0002-supinfo02.zip", "prioritizr/prioritizrdata",
  tempdir(), tag = "v0.0.0"
)
fetch_file(
  "Vulnerable_Carbon_Total_v1a_300m_2018_crop.zip", "prioritizr/prioritizrdata",
  tempdir(), tag = "v0.0.0"
)
fetch_file(
  "extinction-risk.csv.zip", "prioritizr/prioritizrdata",
  tempdir(), tag = "v0.0.0"
)
fetch_file(
  "eBird_taxonomy_v2025.zip", "prioritizr/prioritizrdata",
  tempdir(), tag = "v0.0.0"
)

## extract geotiff file from zip file
unzip(
  file.path(tempdir(), "Vulnerable_Carbon_Total_v1a_300m_2018_crop.zip"),
  exdir = tempdir()
)

## load data
wa_data <- prioritizrdata::get_wa_features()
int_data <-
  file.path(tempdir(), "csp2340-sup-0002-supinfo02.zip") %>%
  readr::read_csv() %>%
  setNames(gsub(" ", "_",  names(.), fixed = TRUE)) %>%
  setNames(tolower(names(.)))
extinction_risk_path <- file.path(tempdir(), "extinction-risk.csv.zip")
taxon_data <-
  file.path(tempdir(), "eBird_taxonomy_v2025.zip") %>%
  readr::read_csv() %>%
  setNames(tolower(names(.)))
carbon_data <-
  file.path(tempdir(), "Vulnerable_Carbon_Total_v1a_300m_2018_crop.tif") %>%
  terra::rast()

# Preliminary processing
## create attribute data for features
attr_data <- tibble::tibble(name = names(wa_data))

## manually add alternative names for features
attr_data <-
  attr_data %>%
  dplyr::mutate(
    binomial = stringr::str_replace(
      pattern = " [(]([^;]*)[)]", replacement = "",  name
    ),
    alt_binomial = dplyr::case_when(
      binomial == "Spizelloides arborea" ~ "Passerella arborea",
      binomial == "Picoides dorsalis" ~ "Picoides tridactylus",
      binomial == "Himantopus mexicanus" ~ "Himantopus himantopus",
      binomial == "Haematopus bachmani" ~ "Haematopus ater",
      binomial == "Chroicocephalus philadelphia" ~ "Larus philadelphia",
      binomial == "Phalacrocorax penicillatus" ~ "Urile penicillatus",
      binomial == "Icterus bullockii" ~ "Icterus bullockiorum",
      binomial == "Phalacrocorax auritus" ~ "Nannopterum auritum",
      binomial == "Coccothraustes vespertinus" ~ "Hesperiphona vespertina",
      binomial == "Butorides virescens" ~ "Butorides striata",
      binomial == "Dryobates villosus" ~ "Leuconotopicus villosus",
      binomial == "Phalacrocorax pelagicus" ~ "Urile pelagicus",
      binomial == "Dryocopus pileatus" ~ "Hylatomus pileatus",
      binomial == "Regulus calendula" ~ "Corthylio calendula",
      binomial == "Antigone canadensis" ~ "Grus canadensis",
      binomial == "Dryobates albolarvatus" ~ "Leuconotopicus albolarvatus",
      binomial == "Melanitta deglandi/stejnegeri" ~ "Melanitta deglandi",
      binomial == "Phalaropus tricolor" ~ "Steganopus tricolor",
      TRUE ~ NA_character_
    )
  )

# Obtain IUCN Red List threat statuses
if (file.exists(extinction_risk_path)) {
  ## if available, then import previously processed data
  extinction_risk_data <- readr::read_csv(extinction_risk_path)
} else {
  ## otherwise, then download data from API
  extinction_risk_data <-
    attr_data %>%
    dplyr::select(binomial, alt_binomial) %>%
    dplyr::distinct() %>%
    split(.$binomial) %>%
    lapply(function(x) {
      # extract species name
      curr_spp <- x$binomial[[1]]
      if (!is.na(x$alt_binomial[[1]])) {
        curr_spp <- x$alt_binomial[[1]]
      }
      curr_spp <- strsplit(curr_spp, " ", fixed = TRUE)[[1]]
      # wait a couple of seconds to avoid being blocked from Red List API
      Sys.sleep(2)
      # return threat status for latest assessment,
      # and if no assessment could be found, then return NA
      curr_assessment <- try(
        rredlist::rl_species_latest(
          genus = curr_spp[[1]],
          species = curr_spp[[2]]
        ),
        silent = TRUE
      )
      # extract threat status, family, order
      curr_family <- NA_character_
      curr_order <- NA_character_
      curr_status <- NA_character_
      if (!inherits(curr_assessment, "try-error")) {
        curr_family <- curr_assessment$taxon$family_name
        curr_order <- curr_assessment$taxon$order_name
        curr_status <- curr_assessment$red_list_category$code
      }
      # return result
      tibble::tibble(
        binomial = x$binomial[[1]],
        family = curr_family,
        order = curr_order,
        status = curr_status
      )
    }) %>%
    dplyr::bind_rows() %>%
    dplyr::mutate(
      family = tools::toTitleCase(tolower(family)),
      order = tools::toTitleCase(tolower(order))
    ) %>%
    dplyr::mutate(
      extinction_prob = dplyr::case_when(
        status == "EP" ~ 1,
        status == "EX" ~ 1,
        status == "CR" ~ 0.9688,
        status == "EN" ~ 0.4276,
        status == "VU" ~ 0.0513,
        status == "NT" ~ 0.0071,
        status == "LC" ~ 0.0009,
        TRUE ~ NA_real_
      )
    ) %>%
    dplyr::select(binomial, family, order, extinction_prob)
  ## save data
  readr::write_csv(extinction_risk_data, extinction_risk_path)
  piggyback::pb_upload(
    extinction_risk_path,
    name = basename(extinction_risk_path),
    "prioritizr/prioritizrdata", tag = "v0.0.0"
  )
}

# Identify species extinction probabilities
## data obtained from:
## https://doi.org/10.1073/pnas.1804906115
attr_data <-
  attr_data %>%
  dplyr::left_join(extinction_risk_data, by = "binomial")

## sanity checks
assertthat::assert_that(
  assertthat::noNA(attr_data$extinction_prob)
)

# Identify species' public interest scores
## identify species binomial names for public interest data
int_data <-
  int_data %>%
  dplyr::left_join(
    taxon_data %>%
    dplyr::select(sci_name, primary_com_name, family) %>%
    dplyr::rename(binomial = sci_name, species = primary_com_name) %>%
    dplyr::mutate(
      family = vapply(
        strsplit(family, " ", fixed = TRUE),
        `[[`, character(1), 1
      )
    ),
    by = "species"
  )

## calculate total public interest scores
int_data <-
  int_data %>%
  dplyr::summarize(
    interest = sum(total_ebird_observations_in_region, na.rm = TRUE),
    .by = c("binomial", "family")
  ) %>%
  dplyr::filter(!is.na(family))

## add public interest score to attribute data
attr_data <-
  attr_data %>%
  dplyr::left_join(
    int_data %>%
    dplyr::select(binomial, interest),
    by = "binomial"
  )

## if any species are missing public interest data,
## then interpolate these based on average for all species in dataset
if (any(is.na(attr_data$interest))) {
  attr_data <-
    attr_data %>%
    dplyr::left_join(
      int_data %>%
      dplyr::summarize(
        interp_interest = mean(interest, na.rm = TRUE),
        .by = "family"
      ),
      by = "family"
    ) %>%
    dplyr::mutate(
      interest = dplyr::if_else(is.na(interest), interp_interest, interest)
    ) %>%
    dplyr::select(-interp_interest)
}

## sanity checks
assertthat::assert_that(
  assertthat::noNA(attr_data$interest)
)

## format columns
attr_data <-
  attr_data %>%
  dplyr::rename(interest_score = interest) %>%
  dplyr::rename(feature = name) %>%
  dplyr::select(
    feature, binomial, family, order,
    extinction_prob, interest_score
  )

# Process carbon data
## prepare template for reprojecting data
template_data <-
  {wa_data[[1]]} %>%
  terra::project(terra::crs(carbon_data))

## resample data
### note that we disaggregate the data to help avoid issues with
### reprojected data on coastlines getting NA values
wa_carbon_data <-
  carbon_data %>%
  terra::crop(terra::ext(template_data)) %>%
  terra::project(
    wa_data[[1]] %>% terra::disagg(fact = 5),
    method = "bilinear"
  ) %>%
  terra::aggregate(fact = 5, fun = "mean", na.rm = TRUE) %>%
  setNames("carbon")

## remove template, since not needed anymore
rm(template_data)

## set zeros for planning units that have NA values
idx <- terra::cells(!is.na(wa_data[[1]]) & is.na(wa_carbon_data), 1)[[1]]
wa_carbon_data[idx] <- 0

## mask data
wa_carbon_data <-
  wa_carbon_data %>%
  terra::mask(wa_data[[1]])

## sanity checks
assertthat::assert_that(
  identical(
    ## find cell indiceds with non-missing data in wa dataset
    terra::cells(is.na(wa_data[[1]]), 0)[[1]],
    ## find cell indiceds with non-missing data in carbon dataset
    terra::cells(is.na(wa_carbon_data), 0)[[1]]
  ),
  msg = "raster datasets must have NA values in same pixels"
)

# Exports
## attribute data
attr_path <- file.path("inst", "extdata", "wa_attr_data.rds")
saveRDS(as.data.frame(attr_data), attr_path, compress = "gzip")

## carbon data
wa_carbon_path <- file.path("inst", "extdata", "wa_carbon.tif")
terra::writeRaster(
  wa_carbon_data,
  filename = wa_carbon_path,
  ## options to reduce file size
  gdal = c("COMPRESS=DEFLATE", "PREDICTOR=3", "TILED=YES"),
  NAflag = -1,
  overwrite = TRUE
)
