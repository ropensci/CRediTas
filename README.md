
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CRediTas

<!-- badges: start -->

[![R-CMD-check](https://github.com/jospueyo/CRediTas/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jospueyo/CRediTas/actions/workflows/R-CMD-check.yaml)
[![Status at rOpenSci Software Peer
Review](https://badges.ropensci.org/576_status.svg)](https://github.com/ropensci/software-review/issues/576)
<!-- badges: end -->

The goal of CRediTas is to facilitate the tedious job of creating
[CRediT authors statements](https://credit.niso.org/) for scientific
publications. Normally, the first author of a scientific paper organizes
a table in a spreadsheet where all the authors self-state their
contributions. Often too, it is the first author responsibility to state
the contributions of all co-authors. However, at the end, the
information has to be translated to the CRediT statement format of
“Author 1: roles Authors 2: roles …” which is prone to errors and
tedious, especially if there are many co-authors. The CRediTas package
aims to make this easier by providing a template to be filled in form of
a table (csv) and then converting this table to CRediT statement format.

## Installation

You can install the development version of CRediTas from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("jospueyo/CRediTas")
```

## Example

The workflow is meant to work with three basic functions. First, we
create a template table. It can be created as a `data.frame` and being
populated in R. Or as a csv file and being populated in your preferred
csv editor.

``` r
library(CRediTas)

template_create(authors = c("Alexander Humboldt", "Carl Ritter"), file = tempfile())

cras_table <- template_create(authors = c("Friedrich Ratzel", 
                                          "Pau Vidal de la Blache", 
                                          "Pau Vila",
                                          "Élisée Reclus"))
knitr::kable(cras_table)
```

| Authors                | Conceptualization | Methodology | Software | Validation | Formal Analysis | Investigation | Resources | Data curation | Writing - original draft | Writing - review & editing | Visualization | Supervision | Project administration | Funding acquisition |
|:-----------------------|------------------:|------------:|---------:|-----------:|----------------:|--------------:|----------:|--------------:|-------------------------:|---------------------------:|--------------:|------------:|-----------------------:|--------------------:|
| Friedrich Ratzel       |                 0 |           0 |        0 |          0 |               0 |             0 |         0 |             0 |                        0 |                          0 |             0 |           0 |                      0 |                   0 |
| Pau Vidal de la Blache |                 0 |           0 |        0 |          0 |               0 |             0 |         0 |             0 |                        0 |                          0 |             0 |           0 |                      0 |                   0 |
| Pau Vila               |                 0 |           0 |        0 |          0 |               0 |             0 |         0 |             0 |                        0 |                          0 |             0 |           0 |                      0 |                   0 |
| Élisée Reclus          |                 0 |           0 |        0 |          0 |               0 |             0 |         0 |             0 |                        0 |                          0 |             0 |           0 |                      0 |                   0 |

As you can see, the table is empty. So you must provide the information
of who did what. You can use the `fix` function to fill the template
directly in R:

``` r
fix(cras_table)
```

If you wrote the template to a file, then you can read it back to R as
follows:

``` r
cras_table <- template_read(path_to_your_csv_file)
```

Once the `cras_table` is populated, for instance:

| Authors                | Conceptualization | Methodology | Software | Validation | Formal Analysis | Investigation | Resources | Data curation | Writing - original draft | Writing - review & editing | Visualization | Supervision | Project administration | Funding acquisition |
|:-----------------------|------------------:|------------:|---------:|-----------:|----------------:|--------------:|----------:|--------------:|-------------------------:|---------------------------:|--------------:|------------:|-----------------------:|--------------------:|
| Friedrich Ratzel       |                 0 |           0 |        0 |          0 |               0 |             1 |         0 |             0 |                        0 |                          1 |             1 |           0 |                      1 |                   0 |
| Pau Vidal de la Blache |                 0 |           1 |        1 |          0 |               0 |             1 |         0 |             0 |                        0 |                          1 |             0 |           1 |                      1 |                   0 |
| Pau Vila               |                 0 |           0 |        0 |          0 |               0 |             0 |         0 |             0 |                        0 |                          0 |             0 |           0 |                      0 |                   0 |
| Élisée Reclus          |                 1 |           1 |        1 |          1 |               0 |             0 |         0 |             1 |                        1 |                          0 |             1 |           0 |                      0 |                   1 |

A text file can be generated following the CRediT author statement
format. Since `drop = TRUE` by default, the authors without contribution
are removed from the statement, Pau Vila in this case.

``` r
textfile <- tempfile()

cras_write(cras_table, textfile, markdown = TRUE, quiet = TRUE)
```

If you open the text file, you will find this:

**Friedrich Ratzel:** Investigation, Writing - review & editing,
Visualization, Project administration **Pau Vidal de la Blache:**
Methodology, Software, Investigation, Writing - review & editing,
Supervision, Project administration **Élisée Reclus:**
Conceptualization, Methodology, Software, Validation, Data curation,
Writing - original draft, Visualization, Funding acquisition
