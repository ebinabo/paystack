#' Fetch Bulk Charge Batch
#'
#' @description This endpoint retrieves a specific batch code. It also returns useful information on its progress by way of the total_charges and pending_charges attributes.
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param batch_id string. REQUIRED
#' An ID or code for the transfer batch whose details you want to retrieve.
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
#' @description This endpoint retrieves the charges associated with a specified batch code. Pagination parameters are available. You can also filter by status. Charge statuses can be pending, success or failed.
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param batch_id string. REQUIRED
#' An ID or code for the batch whose details you want to retrieve.
#' @param ... Body Params
#' @param status string. pending, success or failed
#' @param perPage int32.
#' @param page int32.
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
    GET(authorization, body = list(...))
}


#' Initiate Bulk Charge
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param reference string.
#' A reference for this batch. If it collides with an existing batch reference, we will discard.
#' @param ... Body Params .example
#'
#' @return
#'
#' @importFrom magrittr %>%
#' @importFrom httr POST
#' @export
#'
#' @examples
#' data.frame(
#'   authorization = c("AUTH_n95vpedf", "AUTH_ljdt4e4j"),
#'   amount = c(23500, 34000)
#' ) %>% toJSON(pretty = T)
initiate_bulk_charge <- function(authorization, reference = "", ...){
  paste(urls$bulkcharge$base, reference, sep = "/") %>%
    POST(authorization, body = list(...))
}


#' List Bulk Charge Batches
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param perPage int32.
#' Specify how many records you want to retrieve per page
#' @param page int32.
#' Specify exactly what page you want to retrieve
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
list_bulk_charge_batches <- function(authorization, ...){
  GET(urls$bulkcharge$base, authorization, body = list(...))
}


#' Pause Bulk Charge Batch
#'
#' @description Use this endpoint to pause processing a batch
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param batch_code string. REQUIRED
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
#' @description Use this endpoint to resume processing a batch
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param batch_code string. REQUIRED
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


