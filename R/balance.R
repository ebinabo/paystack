#' Check Balance
#'
#' @description You can only transfer from what you have
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
check_balance <- function(authorization){
  GET(urls$balance, authorization)
}
