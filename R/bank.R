#' List Banks
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
list_banks <- function(authorization, ...){
  GET(urls$bank$base, authorization, query = list(...))
}


#' Resolve BVN
#'
#' @param authorization
#' @param bvn
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
resolve_bvn <- function(authorization, bvn){
  paste(urls$bank$resolve_bvn, bvn, sep = "/") %>%
    GET(authorization)
}


#' Resolve Account Number
#'
#' @param authorization
#' @param ...
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
resolve_bvn <- function(authorization, ...){
  paste(urls$bank$resolve_acc_no, bvn, sep = "/") %>%
    GET(authorization)
}
