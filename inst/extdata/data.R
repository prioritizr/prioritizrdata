# Initialization
## load packages
library(devtools)
library(raster)
library(sp)
library(sf)

## load data
salt_features <- stack("inst/extdata/salt_features.tif")
salt_pu <- raster("inst/extdata/salt_pu.tif")
tas_features <- stack("inst/extdata/tas_features.tif")
tas_pu <- shapefile("inst/extdata/tas_pu.shp")

# Main processing
## project Tasmania data
tas_pu <- spTransform(tas_pu, as(st_crs(32755), "CRS"))
tas_features <- projectRaster(tas_features, method = "ngb",
                              crs = tas_pu@proj4string)

## force NA values in marine areas
for (i in seq_len(nlayers(tas_features)))
  tas_features[[i]][is.na(tas_features[[i]])] <- 0
tas_pu_raster <- rasterize(tas_pu, tas_features[[1]])
tas_features <- mask(tas_features, tas_pu_raster)

## force logical data types for locked columns in tas_pu
tas_pu$locked_in <- as.logical(tas_pu$locked_in)
tas_pu$locked_out <- as.logical(tas_pu$locked_out)

## project Salt Spring Island data
salt_pu <- salt_pu * 1e-5
salt_data <- stack(salt_pu, salt_features)
salt_data <- projectRaster(salt_data, method = "bilinear",
                           crs = sp::CRS("+init=epsg:32610"))
salt_pu <- salt_data[[1]]
salt_features <- salt_data[[-1]]
salt_features <- mask(salt_features, salt_pu)
raster::compareRaster(salt_pu, salt_features[[1]], res = TRUE)

# Exports
## fully load raster data
tas_features <- as(readAll(tas_features), "RasterStack")
salt_features <- as(readAll(salt_features), "RasterStack")

## set CRS
tas_pu@proj4string <- as(st_crs(32755), "CRS")
crs(tas_features) <- as(st_crs(32755), "CRS")
crs(salt_pu) <- as(st_crs(32610), "CRS")
crs(salt_features) <- as(st_crs(32610), "CRS")

## save data
save(tas_pu, file = "data/tas_pu.rda", compress = "xz")
save(tas_features, file = "data/tas_features.rda", compress = "xz")
save(salt_pu, file = "data/salt_pu.rda", compress = "xz")
save(salt_features, file = "data/salt_features.rda", compress = "xz")
