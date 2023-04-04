file <- tempfile()
template_create(authors = c("A", "B"), file = file)

roles <- roles_get()
cras_table <- template_read(file)

test_that("template_read works", {
  expect_s3_class(cras_table, "data.frame")
})

test_that("column names are not altered", {
  expect_equal(c("Authors", roles), names(cras_table))
})

file <- tempfile()
cras_prov <- template_create(authors = c("A", "B"))
names(cras_prov)[1] <- "authors"
write.csv2(cras_prov, file)

test_that("stop if Authors column not present", {
  expect_error(template_read(file))
})

file <- tempfile()
cras_prov <- template_create(authors = c("A", "B"))
cras_prov$Authors <- c(1,2)
write.csv2(cras_prov, file)

test_that("warning if roles are not numeric", {
  expect_warning(template_read(file))
})


file <- tempfile()
cras_prov <- template_create(authors = c("A", "B"))
cras_prov$Conceptualization <- "A"
write.csv2(cras_prov, file)

test_that("warning if roles are not numeric", {
  expect_warning(template_read(file))
})


file <- tempfile()
cras_prov <- template_create(authors = c("A", "B"))
cras_prov$Conceptualization <- "A"
write.csv2(cras_prov, file)

test_that("warning if roles are not numeric", {
  expect_warning(template_read(file))
})
