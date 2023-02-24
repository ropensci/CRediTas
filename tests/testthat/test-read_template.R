file <- tempfile()
create_template(authors = c("A", "B"), file = file)

roles <- c(
  "Conceptualization",
  "Methodology",
  "Software",
  "Validation",
  "Formal analysis",
  "Investigation",
  "Resources",
  "Data curation",
  "Writing - Original Draft",
  "Writing - Review & Editing",
  "Visualization",
  "Supervision",
  "Project administration",
  "Funding acquisition"
)

test_that("read_template works", {
  expect_s3_class(read_template(file), "data.frame")
})

test_that("column names are not altered", {
  cras_table <- read_template(file)
  expect_equal(c("Authors", roles), names(cras_table))
})
