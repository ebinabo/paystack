#' List Banks
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param perPage int32.
#' Specify how many records you want to retrieve per page
#' @param page int32.
#' Specify exactly what page you want to retrieve
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
list_banks <- function(authorization, ...){
  GET(urls$bank$base, authorization, body = list(...))
}


#' Resolve Account Number
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param account_number string. Account Number
#' @param bank_code string. Bank Code
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
resolve_account_number <- function(authorization, ...){
  paste(urls$bank$resolve_acc_no, bvn, sep = "/") %>%
    GET(authorization)
}


#' Resolve BVN
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
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

