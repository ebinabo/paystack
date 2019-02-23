#' Fetch Settlements
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
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
