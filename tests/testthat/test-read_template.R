file <- tempfile()
test_template <- create_template(authors = c("A", "B"), file = file)

test_that("read_template works", {
  expect_s3_class(read_template(file), "data.frame")
})
