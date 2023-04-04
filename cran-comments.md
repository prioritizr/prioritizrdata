Dear CRAN volunteers,

Thank you for reviewing this submission. This submission updates the package for compatibility with the new version of the prioritizr R package. It also provides an additional case study dataset, and removes dependencies for _rgeos_ and _rgdal_ in anticipation of their retirement. It addresses the documentation issues raised in our previous CRAN submission.

Cheers,

Richard Schuster

## R CMD check results

0 errors | 0 warnings | 1 note

* Found the following (possibly) invalid URLs:
  URL: https://www.bcassessment.ca
    From: man/salt_data.Rd
    Status: 500
    Message: Internal Server Error

  **I have manually checked this URL and confirm that it is valid.**

## Test environments

* [Ubuntu 20.04, R-release](https://github.com/prioritizr/prioritizrdata/actions?query=workflow%3AUbuntu)
* [Ubuntu 20.04, R-devel](https://github.com/prioritizr/prioritizrdata/actions?query=workflow%3AUbuntu)
* [Mac OSX 10.15, R-release](https://github.com/prioritizr/prioritizrdata/actions?query=workflow%3A%22Mac+OSX%22)
* [Windows Server 2019, R-release](https://github.com/prioritizr/prioritizrdata/actions?query=workflow%3AWindows)
* Windows Server 2008 (x64), R-devel (win-builder)

## Downstream dependencies

This package has a single dependency (i.e., the _prioritizr_ package).
The dependency passes all checks successfully with the new version.
