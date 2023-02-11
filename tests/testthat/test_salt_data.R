context("salt data")

test_that("salt_pu", {
  salt_pu <- get_salt_pu()
  expect_is(salt_pu, "SpatRaster")
  expect_gt(terra::global(salt_pu, "min", na.rm = TRUE)[[1]], 0)
})

test_that("salt_features", {
  salt_features <- get_salt_features()
  expect_is(salt_features, "SpatRaster")
  expect_true(
    all(terra::global(salt_features, "min", na.rm = TRUE)[[1]] >= 0)
  )
})

test_that("standardized missing values", {
  salt_pu <- get_salt_pu()
  salt_features <- get_salt_features()
  expect_equal(nonNA_cells(salt_pu), nonNA_cells(sum(salt_features)))
})

test_that("rasters are comparable", {
  salt_pu <- get_salt_pu()
  salt_features <- get_salt_features()
  expect_true(
    terra::compareGeom(salt_pu, salt_features, stopOnError = FALSE)
  )
})
