# CRediTas 0.1.0.9000

## Breaking changes

- Package name changed to CRediTas (#1)
- All function renamed to follow object_verb() convention. (#4)
    - `create_template` is `template_create`
    - `read_template` is `template_read`
    - `write_cras` is `cras_write`
- `file` argument in `cras_write` and in `template_create` no longer default to `NULL`, they are not provided by default. If missing, they behave like the old `NULL` value. 

## New features

- `cras_write` integrates better with literate programming such as rmarkdown and 
quarto. When file is NULL (new default), instead of writing a file, the 
function returns a string with the CRediT Author Statement. It works well with 
inline code in rmarkdown and quarto documents: 
`r cras_write(cras_table, markdown = TRUE)` (#2
- `cras_write` includes a new argument `drop_authors`, if set to `FALSE`, the authors without contributions are not removed from the statement. (#6)

## Minor improvements and fixes

- The roles are created using the function roles_get() instead of hard coded. (#3)
- The former allows to check if authors’ roles are up-to-date comparing with
[CRediT] (https://credit.niso.org/) (#3)
- Improvements on the documentation of all functions (#6)
- In `cras_write`, the default of `markdown` argument is `TRUE`. 
- Added some checks to `template_read` to ensure that the format is correct. (#6)
- Added reviewers of ROpenScience to `DESCRIPTION`. 
- CSS fixed in pkgdown.
- Description added to `template_create` documentation.
- Option to use `fix()` to edit the template is added to `README` and `get_started` vignette.
- Related packages added to `README`.
- `template_create` is more performant thanks to using `matrix` instead of `data.frame` to create the empty contributions.
