# Salt Spring Island data

Conservation planning dataset for Salt Spring Island, Canada. It was
obtained as part of an online *Marxan*-based planning tool created for
the Coastal Douglas-fir Conservation Partnership (CDFCP; Schuster *et
al.* 2017).

## Usage

``` r
get_salt_pu()

get_salt_features()

get_salt_con()
```

## Format

- salt_pu:

  [`terra::rast()`](https://rspatial.github.io/terra/reference/rast.html)
  object.

- salt_features:

  [`terra::rast()`](https://rspatial.github.io/terra/reference/rast.html)
  object.

- salt_con:

  [`terra::rast()`](https://rspatial.github.io/terra/reference/rast.html)
  object.

## Details

The following functions are provided to import data:

- `get_salt_pu()`:

  Import planning unit data. The planning units are a single layer
  [`terra::rast()`](https://rspatial.github.io/terra/reference/rast.html)
  object. Cell values denote the monetary cost of acquiring different
  areas (e.g., a value of 1 = \$100,000 CAD; BC Land Assessment 2015).

- `get_salt_features()`:

  Import biodiversity feature data. The feature data are a multi-layer
  [`terra::rast()`](https://rspatial.github.io/terra/reference/rast.html)
  object object. It contains the spatial distribution of four key
  ecological communities. Each layer represents a different community
  type. These classes are (i) old forest, (ii) savanna, (iii) wetland,
  and (iv) shrub. For each layer, values indicate the composite
  probability of encountering the suite of bird species most commonly
  associated with that community type.

- `get_salt_con()`:

  Import connectivity data. The connectivity data are a single-layer
  [`terra::rast()`](https://rspatial.github.io/terra/reference/rast.html)
  object. It contains the inverse probability of occurrence of human
  commensal species. Based on the assumption that human modified areas
  impede connectivity for native fauna, cells with higher values have
  higher connectivity.

## References

BC Assessment (2015) Property Information Services. Available at
<https://www.bcassessment.ca/> (Date Accessed 2016/06/13).

Morrell N, Schuster R, Crombie M, and Arcese P (2017) *A Prioritization
Tool for the Conservation of Coastal Douglas-fir Forest and Savannah
Habitats of the Georgia Basin.* The Nature Trust of British Colombia,
Coastal Douglas Fir Conservation Partnership, and the Department of
Forest and Conservation Sciences, University of British Colombia.
Available at
<https://peter-arcese-lab.sites.olt.ubc.ca/files/2016/09/CDFCP_tutorial_2017_05.pdf>
(Date Accessed 2017/10/09).

## Examples

``` r
# load packages
library(terra)
#> terra 1.9.27
library(sf)
#> Linking to GEOS 3.12.2, GDAL 3.9.3, PROJ 9.4.1; sf_use_s2() is TRUE

# import data
salt_pu <- get_salt_pu()
salt_features <- get_salt_features()

# preview planning units
print(salt_pu)
#> class       : SpatRaster
#> size        : 280, 200, 1  (nrow, ncol, nlyr)
#> resolution  : 100, 100  (x, y)
#> extent      : 454589.9, 474589.9, 5394614, 5422614  (xmin, xmax, ymin, ymax)
#> coord. ref. : WGS 84 / UTM zone 10N (EPSG:32610)
#> source      : salt_pu.tif
#> name        :    cost
#> min value   : 0.02552
#> max value   :   10000
plot(salt_pu)


# preview features
print(salt_features)
#> class       : SpatRaster
#> size        : 280, 200, 4  (nrow, ncol, nlyr)
#> resolution  : 100, 100  (x, y)
#> extent      : 454589.9, 474589.9, 5394614, 5422614  (xmin, xmax, ymin, ymax)
#> coord. ref. : WGS 84 / UTM zone 10N (EPSG:32610)
#> source      : salt_features.tif
#> names       : old forest,  savanna,  wetland,    shrub
#> min values  :   0.359505, 0.297921, 0.113279,  0.40131
#> max values  :   0.931229, 0.660817, 0.643471, 0.824972
plot(salt_features)


# preview connectivity data
salt_con <- get_salt_con()
print(salt_con)
#> class       : SpatRaster
#> size        : 280, 200, 1  (nrow, ncol, nlyr)
#> resolution  : 100, 100  (x, y)
#> extent      : 454589.9, 474589.9, 5394614, 5422614  (xmin, xmax, ymin, ymax)
#> coord. ref. : WGS 84 / UTM zone 10N (EPSG:32610)
#> source      : salt_con.tif
#> name        : inverse human
#> min value   :      0.370364
#> max value   :      0.903266
plot(salt_con)

```
