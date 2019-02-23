#' Create Plan
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
create_plan <- function(authorization, ...){
  POST(urls$plan, authorization, query = list(...))
}


#' Fetch Plan
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param plan_id
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
fetch_plan <- function(authorization, plan_id){
  paste(urls$plan, plan_id, sep = "/") %>%
    GET(authorization)
}


#' List Plans
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
list_plans <- function(authorization, ...){
  GET(urls$plan, authorization, query = list(...))
}


#' Update Plan
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param plan_id
#' @param ... Body Params
#'
#' @return
#'
#' @importFrom magrittr %>%
#' @importFrom httr PUT
#' @export
#'
#' @examples
update_plan <- function(authorization, plan_id, ...){
  paste(urls$plan, plan_id, sep = "/") %>%
    PUT(authorization, query = list(...))
}
