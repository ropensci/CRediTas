file <- tempfile()
create_template(authors = c("A", "B"), file = file)

roles <- roles_get()

test_that("read_template works", {
  expect_s3_class(read_template(file), "data.frame")
})

test_that("column names are not altered", {
  cras_table <- read_template(file)
  expect_equal(c("Authors", roles), names(cras_table))
})
