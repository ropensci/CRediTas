#' Write CRediT author statement
#' @description
#' The function transforms the information in the template
#' (from \code{template_create}) to a raw string following the CRediT authors
#' statement format of "author1: contributions author2: contributions ..."
#' @param cras_table A data.frame created using \code{create_template()}
#' @param file The text file to be created. If NULL (default), the statement is
#' returned as a string instead of written to a file.
#' @param drop_authors If TRUE (default) the authors without contributions are
#' removed from the statement. If FALSE, they are kept without contributions
#' assigned.
#' @param overwrite If TRUE, the file is overwritten. Otherwise, a error is
#' triggered.
#' @param markdown If TRUE (default), the authors are surrounded by ** to make
#' them bold in markdown.
#' @param quiet If TRUE and \code{drop_authors} is also TRUE, authors without
#' contributions are silently dropped out.
#' If FALSE, a warning is triggered in case any authors is dropped out.
#' @return A text file with the CRediT authors statement or, if file is NULL
#' (default), a character vector of length 1 with the statement that can be
#' used in a Rmarkdown or quarto document using inline code:
#' \code{`r cras_write(cras_table, markdown = TRUE)`}
#' @examples
#' # Generate a template and populate it (randomwly for this example)
#' cras_table <- template_create(authors = c("Josep Maria", "Jane Doe"))
#' cras_table[,2:ncol(cras_table)] <- sample(0:1, (ncol(cras_table)-1)*2,
#'                                           replace = TRUE)
#'
#' # Create a temporary file just for this example
#' file <- tempfile()
#'
#' # Write to the file
#' cras_write(cras_table, file, markdown = TRUE)
#'
#' # Check the content of the file
#' readLines(file)
#' @export


cras_write <- function(cras_table,
                       file = NULL,
                       drop_authors = TRUE,
                       overwrite = FALSE,
                       markdown = TRUE,
                       quiet = FALSE){

  if(drop_authors)
    cras_table <- drop_authors(cras_table, quiet = quiet)

  cras <- character()

  for (i in seq_len(nrow(cras_table))){

    if (markdown) cras <- paste0(cras,"**")
    cras <- paste0(cras, cras_table$Authors[[i]])
    if (rowSums(cras_table[i, -1]) > 0){
      cras <- paste0(cras, ":")
    }# else if (i < nrow(cras_table)) {
    #   cras <- paste0(cras, " ")
    # }

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

  if(is.null(file)){
    return(cras)
  }

  if(!is.character(file)) stop("file must be NULL or a string")
  if(length(file) > 1) stop("file cannot be a vector of length > 1")

  if(file.exists(file) && isFALSE(overwrite)) stop("The file already exists")

  writeLines(cras, file)
  invisible(cras)
}
