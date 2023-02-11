context("wa data")

test_that("wa_pu", {
  wa_pu <- get_wa_pu()
  expect_is(wa_pu, "SpatRaster")
})

test_that("wa_locked_in", {
  wa_locked_in <- get_wa_locked_in()
  expect_is(wa_locked_in, "SpatRaster")
})

test_that("wa_locked_out", {
  wa_locked_out <- get_wa_locked_out()
  expect_is(wa_locked_out, "SpatRaster")
})

test_that("wa_features", {
  wa_features <- get_wa_features()
  expect_is(wa_features, "SpatRaster")
})

test_that("locked data are feasible", {
  wa_locked_in <- get_wa_locked_in()
  wa_locked_out <- get_wa_locked_out()
  expect_lte(
    terra::global(wa_locked_in + wa_locked_out, "max", na.rm = TRUE)[[1]],
    1
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
