context("tas data")

test_that("tas_pu", {
  expect_is(tas_pu, "SpatialPolygonsDataFrame")
  expect_is(tas_pu$id, "integer")
  expect_is(tas_pu$cost, "numeric")
  expect_is(tas_pu$status, "integer")
  expect_is(tas_pu$locked_in, "logical")
  expect_is(tas_pu$locked_out, "logical")
})

test_that("tas_features", {
  expect_is(tas_features, "RasterStack")
})
