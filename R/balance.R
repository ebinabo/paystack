#' Check Balance
#'
#' @param authorization
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
check_balance <- function(authorization){
  GET(urls$balance, authorization)
}
