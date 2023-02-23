
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
cras_table
#>                  Authors Conceptualization Methodology Software Validation
#> 1       Friedrich Ratzel                 0           0        0          0
#> 2 Pau Vidal de la Blache                 0           0        0          0
#> 3          Élisée Reclus                 0           0        0          0
#>   Formal analysis Investigation Resources Data curation
#> 1               0             0         0             0
#> 2               0             0         0             0
#> 3               0             0         0             0
#>   Writing - Original Draft Writing - Review & Editing Visualization Supervision
#> 1                        0                          0             0           0
#> 2                        0                          0             0           0
#> 3                        0                          0             0           0
#>   Project administration Funding acquisition
#> 1                      0                   0
#> 2                      0                   0
#> 3                      0                   0
```

As you can see, the table is empty. So you must provide the information
of who did what. If you wrote the template to a file, then you can read
it back to R as follows:

``` r

cras_table <- read_template(path_to_your_csv_file)
```

Once the `cras_table` is populated, for instance:

    #>                  Authors Conceptualization Methodology Software Validation
    #> 1       Friedrich Ratzel                 1           0        1          1
    #> 2 Pau Vidal de la Blache                 1           0        1          0
    #> 3          Élisée Reclus                 1           0        1          0
    #>   Formal analysis Investigation Resources Data curation
    #> 1               0             0         0             0
    #> 2               0             0         1             0
    #> 3               0             1         1             1
    #>   Writing - Original Draft Writing - Review & Editing Visualization Supervision
    #> 1                        1                          0             0           0
    #> 2                        0                          0             0           0
    #> 3                        0                          1             0           1
    #>   Project administration Funding acquisition
    #> 1                      0                   0
    #> 2                      1                   0
    #> 3                      0                   1

A text file can be generated following the CRediT author statement
format.

``` r

textfile <- tempfile()

write_cras(cras_table, textfile, markdown = TRUE)
readLines(textfile)
#> [1] "**Friedrich Ratzel:** Conceptualization, Software, Validation, Writing - Original Draft **Pau Vidal de la Blache:** Conceptualization, Software, Resources, Project administration **Élisée Reclus:** Conceptualization, Software, Investigation, Resources, Data curation, Writing - Review & Editing, Supervision, Funding acquisition"
```
