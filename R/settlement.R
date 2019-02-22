#' Fetch Settlements
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
fetch_settlements <- function(authorization, ...){
  GET(urls$settlement, authorization, query = list(...))
}
