cras_table <- create_template(authors = c("ABC", "DEF", "HIJ"))
cras_table$Conceptualization <- c(1,0,0)
cras_table$Methodology <- c(0,1,1)
cras_table$Resources <- c(0,0,1)
cras_table$`Writing - Original Draft` <- c(1,0,0)
cras_table$`Writing - Review & Editing` <- c(0,1,1)
cras_table$`Funding acquisition` <- c(0,0,1)

cras <- "ABC: Conceptualization, Writing - Original Draft DEF: Methodology, Writing - Review & Editing HIJ: Methodology, Resources, Writing - Review & Editing, Funding acquisition"

test_that("write_cras works as expected in raw text", {
  file <- tempfile()
  write_cras(cras_table, file, markdown = FALSE)
  expect_equal(readLines(file), cras)
})

cras_md <- "**ABC:** Conceptualization, Writing - Original Draft **DEF:** Methodology, Writing - Review & Editing **HIJ:** Methodology, Resources, Writing - Review & Editing, Funding acquisition"

test_that("write_cras works as expected in markdown text", {
  file <- tempfile()
  write_cras(cras_table, file, markdown = TRUE)
  expect_equal(readLines(file), cras_md)
})

test_that("do not overwrite the file", {
  file <- tempfile()
  write_cras(cras_table, file)
  expect_error(write_cras(cras_table, file))
})

test_that("do overwrite the file", {
  file <- tempfile()
  write_cras(cras_table, file)
  expect_invisible(write_cras(cras_table, file, overwrite = TRUE))
})
