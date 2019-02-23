#' Create Subaccount
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
create_subaccount <- function(authorization, ...){
  POST(urls$subaccount, authorization, query = list(...))
}


#' Fetch Subaccount
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param subacct_id
#'
#' @return
#'
#' @importFrom magrittr %>%
#' @importFrom httr GET
#' @export
#'
#' @examples
fetch_subaccount <- function(authorization, subacct_id){
  paste(urls$subaccount, subacct_id, sep = "/") %>%
    GET(authorization)
}


#' List Subaccounts
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
list_subaccount <- function(authorization, ...){
  GET(urls$subaccount, authorization, query = list(...))
}


#' Update Subaccount
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param subacct_id
#' @param ... Body Params
#'
#' @return
#'
#' @importFrom magrittr %>%
#' @importFrom httr PUT
#' @export
#'
#' @examples
update_subaccount <- function(authorization, subacct_id, ...){
  paste(urls$subaccount, subacct_id, sep = "/") %>%
    PUT(authorization, query = list(...))
}
