context("wa data")

test_that("wa_pu", {
  wa_pu <- get_wa_pu()
  expect_is(wa_pu, "SpatRaster")
  expect_gt(terra::global(wa_pu, "min", na.rm = TRUE)[[1]], 0)
})

test_that("wa_locked_in", {
  wa_locked_in <- get_wa_locked_in()
  expect_is(wa_locked_in, "SpatRaster")
  expect_gt(terra::global(wa_locked_in, "max", na.rm = TRUE)[[1]], 0)
})

test_that("wa_locked_out", {
  wa_locked_out <- get_wa_locked_out()
  expect_is(wa_locked_out, "SpatRaster")
  expect_gt(terra::global(wa_locked_out, "max", na.rm = TRUE)[[1]], 0)
})

test_that("wa_features", {
  wa_features <- get_wa_features()
  expect_is(wa_features, "SpatRaster")
  expect_true(
    all(terra::global(wa_features, "min", na.rm = TRUE)[[1]] >= 0)
  )
})

test_that("locked data are feasible", {
  wa_locked_in <- get_wa_locked_in()
  wa_locked_out <- get_wa_locked_out()
  expect_lte(
    terra::global(wa_locked_in + wa_locked_out, "max", na.rm = TRUE)[[1]],
    1
  )
})

test_that("non-zero costs in areas not locked in", {
  wa_pu <- get_wa_pu()
  wa_locked_in <- get_wa_locked_in()
  expect_gte(
    terra::global(
      terra::mask(wa_pu, wa_locked_in, maskvalue = 1, updatevalue = NA),
       "min",
       na.rm = TRUE
     )[[1]],
    0
  )
})

test_that("standardized missing values", {
  wa_pu <- get_wa_pu()
  wa_locked_in <- get_wa_locked_in()
  wa_locked_out <- get_wa_locked_out()
  wa_features <- get_wa_features()
  expect_equal(nonNA_cells(wa_pu), nonNA_cells(wa_locked_in))
  expect_equal(nonNA_cells(wa_pu), nonNA_cells(wa_locked_out))
  expect_equal(nonNA_cells(wa_pu), nonNA_cells(sum(wa_features)))
})

test_that("rasters are comparable", {
  wa_pu <- get_wa_pu()
  wa_locked_in <- get_wa_locked_in()
  wa_locked_out <- get_wa_locked_out()
  wa_features <- get_wa_features()
  expect_true(
    terra::compareGeom(wa_pu, wa_locked_out, stopOnError = FALSE)
  )
  expect_true(
    terra::compareGeom(wa_pu, wa_locked_in, stopOnError = FALSE)
  )
  expect_true(
    terra::compareGeom(wa_pu, wa_features, stopOnError = FALSE)
  )
})
