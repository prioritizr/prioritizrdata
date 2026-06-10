test_that("get_wa_features", {
  wa_species <- get_wa_species()
  wa_features <- suppressWarnings(get_wa_features())
  expect_is(wa_features, "SpatRaster")
  expect_equal(terra::values(wa_species), terra::values(wa_features))
})
