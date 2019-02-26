#' Create Customer
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param email string. REQUIRED
#' Customer's email address
#' @param first_name string.
#' Customer's first name
#' @param last_name string.
#' Customer's last name
#' @param phone string.
#' Customer's phone number
#' @param metadata object.
#' A set of key/value pairs that you can attach to the customer. It can be used to store additional information in a structured format.
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
create_customer <- function(authorization, ...){
  POST(urls$customer$base, authorization, body = list(...))
}


#' Deactivate Authorization
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param authorization_code string. REQUIRED
#' Authorization code to be deactivated
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
deactivate_authorization <- function(authorization, ...){
  POST(urls$customer$del_auth, authorization, body = list(...))
}


#' Fetch Customer
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param id int32. REQUIRED Path Param.
#' An email or ID or customer code for the customer you want to fetch
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
list_customers <- function(authorization, ...){
  GET(urls$customer$base, authorization, body = list(...))
}


#' Fetch Customer
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param customer_code
#' @param ... Body Params
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
    PUT(authorization, body = list(...))
}


#' Whitelist / Blacklist Customer
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param customer string. REQUIRED
#' Customer's ID, code, or email address
#' @param risk_action string.
#' One of the possible risk actions. allow to whitelist. deny to blacklist.
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
set_risk_action <- function(authorization, ...){
  POST(urls$customer$set_risk_action, authorization, body = list(...))
}


#' Update Customer
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param id string. REQUIRED Path Param.
#' Unique customer_id to update
#' @param ... Body Params
#' @param first_name string.
#' Customer's first name
#' @param last_name string.
#' Customer's last name
#' @param phone string.
#' Customer's phone number
#' @param metadata object.
#' A set of key/value pairs that you can attach to the customer. It can be used to store additional information in a structured format.
#'
#' @return
#'
#' @importFrom httr PUT
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
update_customer <- function(authorization, id, ...){
  paste(urls$customer$base, id, sep = "/") %>%
    PUT(authorization, body = list(...))
}
