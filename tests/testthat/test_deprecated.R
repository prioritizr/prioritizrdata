test_that("get_wa_features", {
  wa_species <- get_wa_species()
  expect_warning(
    wa_features <- get_wa_features(),
    "deprecated"
  )
  expect_is(wa_features, "SpatRaster")
  expect_equal(terra::values(wa_species), terra::values(wa_features))
})
