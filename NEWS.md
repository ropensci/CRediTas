# CRediTas 0.1.0.9000

## Breaking changes

- All function renamed to follow object_verb() convention.
    - `create_template` is `template_create`
    - `read_template` is `template_read`
    - `write_cras` is `cras_write`
- Package name changed to CRediTas (#1)

## New features

- `cras_write` integrates better with literate programming such as rmarkdown and 
quarto. When file is NULL (new default), instead of writing a file, the 
function returns a string with the CRediT Author Statement. It works well with 
inline code in rmarkdown and quarto documents: 
`r cras_write(cras_table, markdown = TRUE)` (#2)
- `cras_write` includes a new argument `drop_authors`, if set to `FALSE`, the authors without contributions are not removed from the statement.

## Minor improvements and fixes

- The roles are created using the function roles_get() instead of hard coded.
- The former allows to check if authors’ roles are up-to-date comparing with
[CRediT] (https://credit.niso.org/)
- Improvements on the documentation of all functions
- In `cras_write`, the default of `markdown` argument is `TRUE`.
- Added some checks to `template_read` to ensure that the format is correct.
