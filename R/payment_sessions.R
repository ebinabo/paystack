#' Fetch Payment Session Timeout
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
fetch_payment_session_timeout <- function(authorization){
  GET(urls$integration$payment_session_timeout, authorization)
}


#' Update Payment Session Timeout
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param timeout int32.
#' Time before stopping session (in seconds). Set to 0 to cancel session timeouts
#'
#' @return
#'
#' @importFrom httr PUT
#' @export
#'
#' @examples
update_payment_session_timeout <- function(authorization, ...){
  PUT(urls$integration$payment_session_timeout, authorization)
}
