#' Create Subscription
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
create_subscription <- function(authorization, ...){
  POST(urls$subscription$base, authorization, query = list(...))
}


#' Disable Subscription
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
disable_subscription <- function(authorization, ...){
  POST(urls$subscription$disable, authorization, query = list(...))
}


#' Enable Subscription
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
enable_subscription <- function(authorization, ...){
  POST(urls$subscription$enable, authorization, query = list(...))
}


#' Fetch Subscription
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param id
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
fetch_subscription <- function(authorization, id){
  paste(urls$subscription$base, id, sep = "/") %>%
    GET(authorization)
}


#' List Subscriptions
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
list_subscriptions <- function(authorization, ...){
  GET(urls$subscription$base, authorization, query = list(...))
}
