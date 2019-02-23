#' Create Refund
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
create_refund <- function(authorization, ...){
  POST(urls$refund, authorization, query = list(...))
}


#' Fetch Refund
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param trans_id
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
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
lıst_refunds <- function(authorization, ...){
  POST(urls$refund, authorization, query = list(...))
}

