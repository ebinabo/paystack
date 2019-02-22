#' Fetch Payment Session Timeout
#'
#' @param authorization
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
#' @param authorization
#'
#' @return
#'
#' @importFrom httr PUT
#' @export
#'
#' @examples
update_payment_session_timeout <- function(authorization){
  PUT(urls$integration$payment_session_timeout, authorization)
}
