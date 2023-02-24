#' Read a template from a csv file
#' @description The template should be created using \code{create_template()}
#' @param file A character vector with the path to the csv file
#' @returns a data.frame with the content of the csv file
#' @examples
#' # Create a temporary file for this example
#' file <- tempfile()
#'
#' # Create a template and save it to a csv file
#' create_template(authors = c("Josep Maria", "Jane Doe"), file = file)
#'
#' # Read the template back (in real life once it has been populated)
#' read_template(file)
#' @export
#' @importFrom utils write.csv2 read.csv2

read_template <- function(file){
  cras_table <- read.csv2(file)
}
