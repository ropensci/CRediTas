# CRediTas (development version)

# CRediTas 0.2.0

## Breaking changes

-   Package name changed to CRediTas ([#1](https://github.com/jospueyo/CRediTas/issues/1))

## New features

-   `write_cras` integrates better with literatu¡e programming such as `rmarkdown` and `quarto`. When file is `NULL` (new default), instead of writing a file, the function returns a string with the CRediT Author Statement. It works well with inline code in rmarkdown and quarto documents: `` `r write_cras(cras_table,  markdown = TRUE)` `` ([#2](https://github.com/jospueyo/CRediTas/issues/2))

## Minor improvements and fixes
