#' Create Refund
#'
#' @description This creates a refund which is then processed by the Paystack team
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param transaction string. REQUIRED
#' Transaction reference or id
#' @param amount int32.
#' How much in kobo to be refunded to the customer. Amount is optional(defaults to original transaction amount) and cannot be more than the original transaction amount.
#' @param currency string. Three-letter ISO currency
#' @param customer_note string. Customer reason
#' @param merchant_note string. Merchant reason
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
create_refund <- function(authorization, ...){
  POST(urls$refund, authorization, body = list(...))
}


#' Fetch Refund
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param trans_id string. Identifier for transaction to be refunded
#'
#' @return
#'
#' @importFrom httr POST
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
fetch_refund <- function(authorization, trans_id){
  paste(urls$refund, trans_id, sep = "/") %>%
    POST(authorization)
}


#' List Refunds
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param reference string. Identifier for transaction to be refunded
#' @param currency string.
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
lıst_refunds <- function(authorization, ...){
  POST(urls$refund, authorization, body = list(...))
}

