#' Read a template from a csv file
#' @description The template should be created using \code{create_template()}
#' @param file A character vector with the path to the csv file
#' @returns a data.frame with the content of the csv file
#' @examples
#' # Create a temporary file for this example
#' file <- tempfile()
#'
#' # Create a template and save it to a csv file
#' template_create(authors = c("Josep Maria", "Jane Doe"), file = file)
#'
#' # Read the template back (in real life once it has been populated)
#' template_read(file)
#' @export
#' @importFrom utils write.csv2 read.csv2

template_read <- function(file){

  file <- normalizePath(file)

  cras_table <- read.csv2(file, check.names = FALSE)

  if(!("Authors" %in% names(cras_table)))
    stop("A column named `Authors` is missing")

  if(nrow(cras_table) < 1)
    stop("The cras_table has zero rows")

  if(!is.character(cras_table$Authors))
    warning("Authors column is not of type character")

  if(!all(vapply(cras_table[-1], is.numeric, FALSE)))
    warning("Roles are not numeric, it can lead to unexpected behaviour")

  return(cras_table)

}
