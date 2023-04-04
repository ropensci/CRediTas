authors <- c("Josep Maria", "Jane Doe")

test_that("template_create returns data.frame", {
  expect_s3_class(template_create(authors = authors), "data.frame")
})

test_that("create_template does not return anything if file is provided",{
  expect_invisible(template_create(authors, file = tempfile()))
})

test_that("roles passed overwrite the default", {
  custom_roles <- sample(LETTERS, 4)
  template <- template_create(authors, roles = custom_roles)
  expect_equal(names(template), c("Authors", custom_roles))
})

