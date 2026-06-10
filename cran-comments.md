Dear CRAN volunteers,

Thank you for reviewing this submission. In particular, this submission is an update to the prioritizrdata package that is already on CRAN. It provides additional datasets and improved documentation.

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

* [Ubuntu 24.04, R-release](https://github.com/prioritizr/prioritizrdata/actions?query=workflow%3AUbuntu)
* [Ubuntu 24.04, R-devel](https://github.com/prioritizr/prioritizrdata/actions?query=workflow%3AUbuntu)
* [Mac OSX 15.7.4, R-release](https://github.com/prioritizr/prioritizrdata/actions?query=workflow%3A%22Mac+OSX%22)
* [Windows Server 2025, R-release](https://github.com/prioritizr/prioritizrdata/actions?query=workflow%3AWindows)
* Windows Server 2022 (x64), R-devel (win-builder)

## Downstream dependencies

This package has a single (optional) reverse dependency (i.e., the _prioritizr_ package). This reverse dependency passes all checks successfully with the new version.
