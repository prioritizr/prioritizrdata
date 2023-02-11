nonNA_cells <- function(x) {
  terra::cells(is.na(x), 0)[[1]]
}
