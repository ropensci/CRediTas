skip_scraping <- function(){
  if(!requireNamespace("rvest", quietly = TRUE) ||
     !identical(Sys.getenv("LOCAL"), "true"))
    skip("Not in local")
}

extract_roles <- function(tag){

}

test_that("roles_get is updated with CRediT roles", {
  skip_scraping()

  html <- rvest::read_html("https://credit.niso.org/")
  html <- rvest::html_elements(html, "p")
  html <- rvest::html_elements(html, "a")

  roles_index <- rvest::html_attr(html, "href")
  roles_index <- grep(pattern = "contributor-roles", x = roles_index)

  roles <- html[roles_index]
  roles <- rvest::html_text(roles)

  roles <- gsub("–", "-", roles)

  expect_equal(sort(roles), sort(roles_get()))

})

