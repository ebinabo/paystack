#' Parse json response to list
#'
#' @description Takes in an object with a class of "response" returned from calling any of the wrapper functions.
#' Also pipe friendly.
#'
#' @details As long as "status": true,
#' returned item would most likely be a deep list,
#' which means apart from the status and message,
#' other elements of the returned lists would be lists as well
#'
#' @param response A response object
#'
#' @return
#'
#' @importFrom httr content
#' @export
#'
#' @examples
#' bank_list <- list_banks(auth$secret)
#' parse_response(bank_list)
parse_response <- function(response){
  content(response, as = "parsed")
}
