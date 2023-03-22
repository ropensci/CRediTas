file <- tempfile()
template_create(authors = c("A", "B"), file = file)

roles <- roles_get()

test_that("template_read works", {
  expect_s3_class(template_read(file), "data.frame")
})

test_that("column names are not altered", {
  cras_table <- template_read(file)
  expect_equal(c("Authors", roles), names(cras_table))
})

