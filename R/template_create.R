#' Create a template to fill the CRediT author statement.
#' @description Create a template to fill the CRediT author statement.
#' (\url{https://credit.niso.org}). The template is a table where the authors
#' are the rows and the columns are the roles.
#' @param authors A character vector with all the authors to be included in the
#' statement.
#' @param roles A character vector with the roles to be included in the
#' statement. If NULL, it uses all the roles defined in the CRediT author
#' statement.
#' @param file If a path is provided, the template is saved as a csv for excel
#' @returns A dataframe with a row for each author and a column for each role,
#' filled with zeros.
#' @details The dataframe can be edited in R or, if file is provided, it is
#' exported to a csv to be edited manually in your preferred csv editor. The
#' csv is created to be compatible with Microsoft Excel, since it is the most
#' popular spreadsheet software among scientists. Therefore, it is separated
#' by semicolon.
#' @examples
#' template_create(authors = c("Josep Maria", "Jane Doe"))
#' @export


template_create <- function(authors, roles = roles_get(), file = NULL){

  df <- data.frame(Authors = authors)

  mat <- matrix(0, nrow = length(authors), ncol = length(roles))

  colnames(mat) <- roles

  df <- cbind(df, mat)

  if (is.null(file)) return(df)

  write.csv2(df, file, row.names = FALSE)
  invisible()
}



