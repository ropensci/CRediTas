
<!-- README.md is generated from README.Rmd. Please edit that file -->

# credit

<!-- badges: start -->

[![R-CMD-check](https://github.com/jospueyo/credit/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jospueyo/credit/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of credit is to facilitate the tedious job of creating [CRediT
authors statements](https://credit.niso.org/) for scientific
publications.

## Installation

You can install the development version of credit from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("jospueyo/credit")
```

## Example

The workflow is meant to work with three basic functions. First, we
create a template table. It can be created as a `data.frame` and being
populated in R. Or as a csv file and being populated in your preferred
csv editor.

``` r
library(credit)

create_template(authors = c("Alexander Humboldt", "Carl Ritter"), file = tempfile())

cras_table <- create_template(authors = c("Friedrich Ratzel", "Pau Vidal de la Blache", "Élisée Reclus"))
knitr::kable(cras_table)
```

| Authors                | Conceptualization | Methodology | Software | Validation | Formal analysis | Investigation | Resources | Data curation | Writing - Original Draft | Writing - Review & Editing | Visualization | Supervision | Project administration | Funding acquisition |
|:-----------------------|------------------:|------------:|---------:|-----------:|----------------:|--------------:|----------:|--------------:|-------------------------:|---------------------------:|--------------:|------------:|-----------------------:|--------------------:|
| Friedrich Ratzel       |                 0 |           0 |        0 |          0 |               0 |             0 |         0 |             0 |                        0 |                          0 |             0 |           0 |                      0 |                   0 |
| Pau Vidal de la Blache |                 0 |           0 |        0 |          0 |               0 |             0 |         0 |             0 |                        0 |                          0 |             0 |           0 |                      0 |                   0 |
| Élisée Reclus          |                 0 |           0 |        0 |          0 |               0 |             0 |         0 |             0 |                        0 |                          0 |             0 |           0 |                      0 |                   0 |

As you can see, the table is empty. So you must provide the information
of who did what. If you wrote the template to a file, then you can read
it back to R as follows:

``` r
cras_table <- read_template(path_to_your_csv_file)
```

Once the `cras_table` is populated, for instance:

| Authors                | Conceptualization | Methodology | Software | Validation | Formal analysis | Investigation | Resources | Data curation | Writing - Original Draft | Writing - Review & Editing | Visualization | Supervision | Project administration | Funding acquisition |
|:-----------------------|------------------:|------------:|---------:|-----------:|----------------:|--------------:|----------:|--------------:|-------------------------:|---------------------------:|--------------:|------------:|-----------------------:|--------------------:|
| Friedrich Ratzel       |                 0 |           1 |        1 |          0 |               0 |             0 |         1 |             0 |                        0 |                          1 |             0 |           0 |                      1 |                   1 |
| Pau Vidal de la Blache |                 1 |           0 |        0 |          0 |               1 |             0 |         1 |             1 |                        1 |                          1 |             0 |           0 |                      0 |                   0 |
| Élisée Reclus          |                 0 |           1 |        1 |          0 |               1 |             1 |         0 |             0 |                        1 |                          0 |             0 |           1 |                      0 |                   0 |

A text file can be generated following the CRediT author statement
format.

``` r
textfile <- tempfile()

write_cras(cras_table, textfile, markdown = TRUE)
cat(readLines(textfile))
```

    ## **Friedrich Ratzel:** Methodology, Software, Resources, Writing - Review & Editing, Project administration, Funding acquisition **Pau Vidal de la Blache:** Conceptualization, Formal analysis, Resources, Data curation, Writing - Original Draft, Writing - Review & Editing **Élisée Reclus:** Methodology, Software, Formal analysis, Investigation, Writing - Original Draft, Supervision
