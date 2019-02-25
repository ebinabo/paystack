#' Fetch Settlements
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param from date.
#' Lower bound of date range. Leave undefined to export settlement from day one.
#' @param to date.
#' Upper bound of date range. Leave undefined to export settlements till date.
#' @param subaccount string.
#' Provide a subaccount code to export only settlements for that subaccount. Set to none to export only transactions for the account.
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
fetch_settlements <- function(authorization, ...){
  GET(urls$settlement, authorization, body = list(...))
}
