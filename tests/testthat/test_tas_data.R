context("tas data")

test_that("tas_pu", {
  tas_pu <- get_tas_pu()
  expect_is(tas_pu, "sf")
  expect_is(tas_pu$id, "integer")
  expect_is(tas_pu$cost, "numeric")
  expect_is(tas_pu$locked_in, "logical")
  expect_is(tas_pu$locked_out, "logical")
  expect_gte(sum(tas_pu$locked_in), 1)
  expect_gte(sum(tas_pu$locked_out), 1)
  expect_gt(min(tas_pu$cost), 0)
  expect_lte(max(tas_pu$locked_in + tas_pu$locked_out), 1)
})

test_that("tas_features", {
  tas_features <- get_tas_features()
  expect_is(tas_features, "SpatRaster")
  expect_true(
    all(terra::global(tas_features, "min", na.rm = TRUE)[[1]] >= 0)
  )
})
