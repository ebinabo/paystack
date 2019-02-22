#' Fetch Bulk Charge Batch
#'
#' @param authorization
#' @param batch_id
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
fetch_bulk_charge_batch <- function(authorization, batch_id){
  paste(urls$bulkcharge$base, batch_id, sep = "/") %>%
    GET(authorization)
}


#' Fetch Charges in Batch
#'
#' @param authorization
#' @param batch_id
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
fetch_charges_in_batch <- function(authorization, batch_id, ...){
  paste(urls$bulkcharge$base, batch_id, "charges", sep = "/") %>%
    GET(authorization, query = list(...))
}


#' Initiate Bulk Charge
#'
#' @param authorization
#' @param reference
#' @param ...
#'
#' @return
#'
#' @importFrom magrittr %>%
#' @importFrom httr POST
#' @export
#'
#' @examples
initiate_bulk_charge <- function(authorization, reference = "", ...){
  paste(urls$bulkcharge$base, reference, sep = "/") %>%
    POST(authorization, query = list(...))
}


#' List Bulk Charge Batches
#'
#' @param authorization
#' @param ...
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
list_bulk_charge_batches <- function(authorization, ...){
  GET(urls$bulkcharge$base, authorization, query = list(...))
}


#' Pause Bulk Charge Batch
#'
#' @param authorization
#' @param batch_code
#'
#' @return
#'
#' @export
#' @importFrom httr GET
#' @importFrom magrittr %>%
#'
#' @examples
pause_bulk_charge_batch <- function(authorization, batch_code){
  paste(urls$bulkcharge$pause, batch_code, sep = "/") %>%
    GET(authorization)
}


#' Resume Bulk Charge Batch
#'
#' @param authorization
#' @param batch_code
#'
#' @return
#'
#' @export
#' @importFrom httr GET
#' @importFrom magrittr %>%
#'
#' @examples
resume_bulk_charge_batch <- function(authorization, batch_code){
  paste(urls$bulkcharge$resume, batch_code, sep = "/") %>%
    GET(authorization)
}


