# Initialization
## load packages
library(devtools)
library(raster)
library(sp)

## load data
salt_features <- stack("inst/extdata/salt_features.tif")
salt_pu <- raster("inst/extdata/salt_pu.tif")
tas_features <- stack("inst/extdata/tas_features.tif")
tas_pu <- shapefile("inst/extdata/tas_pu.shp")

# Main processing
## project Tasmania data
tas_pu <- spTransform(tas_pu, sp::CRS("+init=epsg:32755"))
tas_features <- projectRaster(tas_features, method = "ngb",
                              crs = tas_pu@proj4string)

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

## save data
save(tas_pu, file = "data/tas_pu.rda", compress = "xz")
save(tas_features, file = "data/tas_features.rda", compress = "xz")
save(salt_pu, file = "data/salt_pu.rda", compress = "xz")
save(salt_features, file = "data/salt_features.rda", compress = "xz")
