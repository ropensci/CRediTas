#' Create a template to fill the credit author statement
#' @param authors A character vector with all the authors to be included in the
#' statement
#' @param roles A character vector with the roles to be included in the
#' statement. If NULL, it uses all the roles defined in the CRediT author
#' statement
#' @param file If a path is provided, the template is saved as a csv for excel
#' @returns A dataframe with a row for each authors and a column for each role,
#' filled with zeros.
#' @details The dataframe can be exported to a csv an edit it by hand.
#' @examples
#' create_template(authors = c("Josep Maria", "Jane Doe"))
#' @export


create_template <- function(authors, roles = NULL, file = NULL){

  if (is.null(roles)){
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
  }

  n_authors <- length(authors)

  df <- data.frame(Authors = authors)
  for (role in roles){
    df[role] <- 0
  }
  if (is.null(file)) return(df)

  write.csv2(df, file, row.names = FALSE)
}



