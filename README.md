
<!-- README.md is generated from README.Rmd. Please edit that file -->

# credit

<!-- badges: start -->

[![R-CMD-check](https://github.com/jospueyo/credit/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jospueyo/credit/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of credit is to facilitate the tedious job of creating [CRediT
authors statements](https://credit.niso.org/) for scientific
publications. Normally, the first author of a scientific paper organizes
a table in a spreadsheet where all the authors self-state their
contributions. Often too, it is the first author responsibility to state
the contributions of all co-authors. However, at the end, the
information has to be translated to the CRediT statement format of
“Author 1: roles Authors 2: roles …” which is prone to errors and
tedious, especially if there are many co-authors. The credit package
aims to make this easier by providing a template to be filled in form of
a table (csv) and then converting this table to CRediT statement format.

## Installation

You can install the development version of credit from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("jospueyo/credit")
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
| Friedrich Ratzel       |                 1 |           0 |        0 |          1 |               1 |             0 |         1 |             0 |                        1 |                          1 |             1 |           0 |                      0 |                   0 |
| Pau Vidal de la Blache |                 0 |           1 |        0 |          0 |               0 |             0 |         0 |             0 |                        0 |                          0 |             1 |           1 |                      0 |                   0 |
| Élisée Reclus          |                 1 |           1 |        1 |          0 |               1 |             1 |         0 |             0 |                        1 |                          0 |             1 |           0 |                      0 |                   1 |

A text file can be generated following the CRediT author statement
format.

``` r
textfile <- tempfile()

write_cras(cras_table, textfile, markdown = TRUE)
```

If you open the text file, you will find this:

**Friedrich Ratzel:** Conceptualization, Validation, Formal analysis,
Resources, Writing - Original Draft, Writing - Review & Editing,
Visualization **Pau Vidal de la Blache:** Methodology, Visualization,
Supervision **Élisée Reclus:** Conceptualization, Methodology, Software,
Formal analysis, Investigation, Writing - Original Draft, Visualization,
Funding acquisition
