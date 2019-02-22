#' Resolve Phone Number
#'
#' @param authorization
#' @param ...
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
