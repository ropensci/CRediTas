#' Write CRediT author statement
#' @param cras_table A data.frame created using \code{create_template()}
#' @param file The text file to be created
#' @param overwrite If TRUE, the file is overwritten. Otherwise, a error is
#' triggered.
#' @param markdown If TRUE, the authors are surrounded by ** to make them bold
#' in markdown.
#' @return A text file with the CRedit authors statement
#' @examples
#' # Generate a template and populate it (randomwly for this example)
#' cras_table <- create_template(authors = c("Josep Maria", "Jane Doe"))
#' cras_table[,2:ncol(cras_table)] <- sample(0:1, (ncol(cras_table)-1)*2,
#'                                           replace = TRUE)
#'
#' # Create a temporary file just for this example
#' file <- tempfile()
#'
#' # Write to the file
#' write_cras(cras_table, file, markdown = TRUE)
#'
#' # Check the content of the file
#' readLines(file)
#' @export


write_cras <- function(cras_table,
                       file = "cras.txt",
                       overwrite = FALSE,
                       markdown = FALSE){

  stopifnot(inherits(cras_table, "data.frame"))
  stopifnot(nrow(cras_table) > 0)
  stopifnot(ncol(cras_table) > 1)

  cras <- character()

  for (i in 1:nrow(cras_table)){

    if (markdown) cras <- paste0(cras,"**")
    cras <- paste0(cras, cras_table$Authors[[i]], ":")
    if (markdown) cras <- paste0(cras,"**")
    cras <- paste0(cras, " ")


    for (j in 2:ncol(cras_table)){

      if(cras_table[i,j, drop=T] > 0) {
      cras <- paste0(cras, names(cras_table)[[j]], ", ")
      }
    }

    cras <- gsub(", $", " ", cras)
  }

  cras <- gsub(" $", "", cras)

  if(file.exists(file) && isFALSE(overwrite)) stop("The file already exists")

  writeLines(cras, file)
  invisible()
}
