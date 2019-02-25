#' Check Slug Availability
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param slug string. REQUIRED
#' URL slug to be confirmed
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
check_slug_availability <- function(authorization, slug){
  paste(urls$page$check, slug, sep = "/") %>%
    GET(authorization)
}


#' Create Page
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param name string. REQUIRED
#' Name of page
#' @param description string.
#' Short description of page
#' @param amount int32.
#' Default amount you want to accept using this page. If none is set, customer is free to provide any amount of their choice. The latter scenario is useful for accepting donations
#' @param slug string.
#' URL slug you would like to be associated with this page. Page will be accessible at https://paystack.com/pay/[slug]
#' @param redirect_url string.
#' If you would like Paystack to redirect someplace upon successful payment, specify the URL here.
#' @param custom_fields array.
#' If you would like to accept custom fields, specify them here. See sample code for details.
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
create_page <- function(authorization, ...){
  POST(urls$page$base, authorization, query = list(...))
}


#' Fetch Page
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param page_id or slug string. REQUIRED Path param
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
fetch_page <- function(authorization, page_id){
  paste(urls$page$base, id) %>%
    GET(authorization)
}


#' List Pages
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
list_pages <- function(authorization, ...){
  GET(urls$page$base, authorization, query = list(...))
}


#' Update Page
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param page_id
#' @param ... Body Params
#' @param name string. REQUIRED
#' Name of page
#' @param description string.
#' Short description of page
#' @param amount int32.
#' Default amount you want to accept using this page. If none is set, customer is free to provide any amount of their choice. The latter scenario is useful for accepting donations
#' @param active boolean.
#' Set to false to deactivate page url
#'
#' @return
#'
#' @importFrom httr PUT
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
update_page <- function(authorization, page_id, ...){
  paste(urls$page$base, page_id, sep = "/") %>%
    PUT(authorization)
}


