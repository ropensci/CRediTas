cras_table <- create_template(authors = c("ABC", "DEF", "HIJ", "KLM"))
cras_table$Conceptualization <- c(1,0,0,0)
cras_table$Methodology <- c(0,1,1,0)
cras_table$Resources <- c(0,0,1,0)
cras_table$`Writing - Original Draft` <- c(1,0,0,0)
cras_table$`Writing - Review & Editing` <- c(0,1,1,0)
cras_table$`Funding acquisition` <- c(0,0,1,0)

cras <- "ABC: Conceptualization, Writing - Original Draft DEF: Methodology, Writing - Review & Editing HIJ: Methodology, Resources, Writing - Review & Editing, Funding acquisition"

test_that("write_cras works as expected in raw text", {
  file <- tempfile()
  write_cras(cras_table, file, markdown = FALSE, quiet = TRUE)
  expect_equal(readLines(file), cras)
})

cras_md <- "**ABC:** Conceptualization, Writing - Original Draft **DEF:** Methodology, Writing - Review & Editing **HIJ:** Methodology, Resources, Writing - Review & Editing, Funding acquisition"

test_that("write_cras works as expected in markdown text", {
  file <- tempfile()
  write_cras(cras_table, file, markdown = TRUE, quiet = TRUE)
  expect_equal(readLines(file), cras_md)
})

test_that("write_cras returns vector when file is null",{
  expect_equal(write_cras(cras_table, file = NULL, quiet = TRUE), cras)
})

test_that("do not overwrite the file", {
  file <- tempfile()
  write_cras(cras_table, file, quiet = TRUE)
  expect_error(write_cras(cras_table, file, quiet = TRUE))
})

test_that("do overwrite the file", {
  file <- tempfile()
  write_cras(cras_table, file, quiet = TRUE)
  expect_invisible(write_cras(cras_table, file, overwrite = TRUE, quiet = TRUE))
})

test_that("raise warning when authors are dropped", {
  expect_warning(write_cras(cras_table, tempfile()))
})

test_that("raise error if all authors are dropped", {
  expect_error(write_cras(create_template(c("a", "b")), tempfile()))
})

test_that("raise error if file is not NULL or string", {
  expect_error(write_cras(cras_table, file = 1223, quiet = TRUE))
})

test_that("raise error if file length is gt 1", {
  expect_error(write_cras(cras_table, file = c("a", "b"), quiet = TRUE))
})
