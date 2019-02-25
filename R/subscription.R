#' Create Subscription
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param authorization string. REQUIRED
#' If customer has multiple authorizations, you can set the desired authorization you wish to use for this subscription here. If this is not supplied, the customer's most recent authorization would be used
#' @param customer string. REQUIRED
#' Customer's email address or customer code
#' @param plan string. REQUIRED
#' Plan code
#' @param start_date string.
#' Set the date for the first debit. (ISO 8601 format)
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
create_subscription <- function(authorization, ...){
  POST(urls$subscription$base, authorization, body = list(...))
}


#' Disable Subscription
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param code string. REQUIRED
#' Subscription code
#' @param token string. REQUIRED
#' Email token
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
disable_subscription <- function(authorization, ...){
  POST(urls$subscription$disable, authorization, body = list(...))
}


#' Enable Subscription
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param code string. REQUIRED
#' Subscription code
#' @param token string. REQUIRED
#' Email token
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
enable_subscription <- function(authorization, ...){
  POST(urls$subscription$enable, authorization, body = list(...))
}


#' Fetch Subscription
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param id_or_subscription_code string. REQUIRED
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
#' @param perPage int32.
#' Specify how many records you want to retrieve per page
#' @param page int32.
#' Specify exactly what page you want to retrieve
#' @param customer int32.
#' Filter by Customer ID
#' @param plan int32.
#' Filter by Plan ID
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
list_subscriptions <- function(authorization, ...){
  GET(urls$subscription$base, authorization, body = list(...))
}
