#' Resolve Phone Number
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
resolve_phone_number <- function(authorization, ...){
  POST(urls$resolve_phone, authorization, query = list(...))
}
