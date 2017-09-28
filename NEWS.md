# prioritizrdata 0.2.0.1 (unreleased)

- Fix links in README and vignettes
- Remove log files accidently commited
- Fix image size in salt vignette

# prioritizrdata 0.2.0.0 (unreleased)

- Created package website.
- Add _viridis_, _rasterVis_, and _prioritizr_packages to Suggests because they are used in
  the vignettes.
- Remove unused _assertthat_ package from Imports
- Disable evaluation of code chunk with `library()` calls in _Saltspring.Rmd_
  so that the vignette can be compiled when `lpsymphony`, `Rsymphony` or `gurobi` are not installed.
- Package authors now consistent with _prioritizr_ package.
- Simplify vignette workflow. Vignettes can now be compiled by using
  `devtools::build_vignettes()`. Earlier versions needed the vignettes to be
  compiled using the _Makefile_ to copy files around to avoid tangled R code
  causing failures during R CMD CHECK. Although no longer needed, the vignettes
  can still be compiled using the shell command `make vigns` if
  desired.
- The _README.Rmd_ now lives in the top-level directory following standard
  practices. It should now be complied using `rmarkdown::render("README.Rmd")`
  or using the shell command `make readme`. Note that the figures for
  `README.md` can be found in the directory `man/figures`.

# prioritizrdata 0.1.1.0 (unreleased)

- Initial package version
