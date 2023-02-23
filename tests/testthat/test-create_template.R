authors <- c("Josep Maria", "Jane Doe")

test_that("create_template returns data.frame", {
  expect_s3_class(create_template(authors = authors), "data.frame")
})

test_that("create_template does not return anything if file is provided",{
  expect_invisible(create_template(authors, file = tempfile()))
})

test_that("roles passed overwrite the default", {
  custom_roles <- sample(LETTERS, 4)
  template <- create_template(authors, roles = custom_roles)
  expect_equal(names(template), c("Authors", custom_roles))
})

