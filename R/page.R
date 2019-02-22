#' Check Slug Availability
#'
#' @param authorization
#' @param slug
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
#' @param authorization
#' @param ...
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
fetch_page <- function(authorization, page_id){
  paste(urls$page$base, id) %>%
    GET(authorization)
}


#' List Pages
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
list_pages <- function(authorization, ...){
  GET(urls$page$base, authorization, query = list(...))
}


#' Update Page
#'
#' @param authorization
#' @param page_id
#' @param ...
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


