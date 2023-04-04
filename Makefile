all: clean docs test check

clean:
	rm -rf man/*
	rm -rf docs/*
	rm -rf inst/doc/*

data:
	R --slave -e "source('inst/extdata/data.R')"

docs: readme man site

man:
	R --slave -e "devtools::document()"

readme:
	R --slave -e "rmarkdown::render('README.Rmd')"

site:
	R --slave -e "pkgdown::build_site(run_dont_run = TRUE)"

quicksite:
	R --slave -e "pkgdown::build_site(run_dont_run = TRUE, lazy = TRUE)"

test:
	R --slave -e "devtools::test()" > test.log 2>&1
	rm -f tests/testthat/Rplots.pdf

check:
	echo "\n===== R CMD CHECK =====\n" > check.log 2>&1
	R --slave -e "devtools::check()" >> check.log 2>&1

spellcheck:
	echo "\n===== SPELL CHECK =====\n" > spell.log 2>&1
	R --slave -e "devtools::spell_check()" >> spell.log 2>&1

wbcheck:
	R --slave -e "devtools::build_win()"

jhwbcheck:
	R --slave -e "devtools::check_win_devel(email = 'jeffrey.hanson@uqconnect.edu.au')"
	cp -R doc inst/

build:
	R --slave -e "devtools::build()"

install:
	R --slave -e "devtools::install_local(force = TRUE)"

urlcheck:
	R --slave -e "devtools::document();urlchecker::url_check()"

.PHONY: data docs readme site test check checkwb build install man
