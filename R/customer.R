#' Create Customer
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
create_customer <- function(authorization, ...){
  POST(urls$customer$base, authorization, query = list(...))
}


#' Deactivate Authorization
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
deactivate_authorization <- function(authorization, ...){
  POST(urls$customer$del_auth, authorization, query = list(...))
}


#' Fetch Customer
#'
#' @param authorization
#' @param id email or id or customer_code
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
fetch_customer <- function(authorization, id){
  paste(urls$customer$base, id, sep = "/") %>%
    GET(authorization)
}


#' List Customers
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
list_customers <- function(authorization, ...){
  GET(urls$customer$base, authorization, query = list(...))
}


#' Update Customer
#'
#' @param authorization
#' @param customer_code
#' @param ...
#'
#' @return
#'
#' @importFrom httr PUT
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
fetch_customer <- function(authorization, customer_code, ...){
  paste(urls$customer$base, customer_code, sep = "/") %>%
    PUT(authorization, query = list(...))
}


#' Whitelist / Blacklist Customer
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
set_risk_action <- function(authorization, ...){
  POST(urls$customer$set_risk_action, authorization, query = list(...))
}
