# Function to check structure of the cras_table

check_cras_table <- function(cras_table){
  stopifnot(inherits(cras_table, "data.frame"))
  stopifnot(nrow(cras_table) > 0)
  stopifnot(ncol(cras_table) > 1)
  stopifnot(names(cras_table)[1] == "Authors")
}

# Function to drop authors without contribution

drop_authors <- function(cras_table, quiet = FALSE){

  check_cras_table(cras_table)

  drop_rows <- vapply(seq_len(nrow(cras_table)),
                      function(i) any(cras_table[i,-1] != 0),
                      FUN.VALUE = logical(1))

  if(all(!drop_rows)) stop("No authors have contributions")

  if(any(drop_rows == FALSE) && !quiet){
    warning("Some authors were droped because of no contributions")
  }

  cras_table[drop_rows,]
}
