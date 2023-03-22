#' Create a template to fill the CRediTas author statement
#' @param authors A character vector with all the authors to be included in the
#' statement
#' @param roles A character vector with the roles to be included in the
#' statement. If NULL, it uses all the roles defined in the CRediT author
#' statement
#' @param file If a path is provided, the template is saved as a csv for excel
#' @returns A dataframe with a row for each authors and a column for each role,
#' filled with zeros.
#' @details The dataframe can be exported to a csv to be edited manually.
#' @examples
#' template_create(authors = c("Josep Maria", "Jane Doe"))
#' @export


template_create <- function(authors, roles = NULL, file = NULL){

  if (is.null(roles)){
    roles <- roles_get()
  }

  n_authors <- length(authors)

  df <- data.frame(Authors = authors)
  for (role in roles){
    df[role] <- 0
  }
  if (is.null(file)) return(df)

  write.csv2(df, file, row.names = FALSE)
  invisible()
}



