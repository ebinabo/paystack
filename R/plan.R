#' Create Plan
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param amount int32. REQUIRED
#' Amount to be charged in kobo
#' @param interval string. REQUIRED
#' Interval in words. Valid intervals are hourly, daily, weekly, monthly,biannually, annually.
#' @param name string. REQUIRED
#' Name of plan
#' @param description string.
#' Short description of plan
#' @param send_invoices boolean.
#' Set to false if you don't want invoices to be sent to your customers
#' @param send_sms boolean.
#' Set to false if you don't want text messages to be sent to your customers
#' @param currency string.
#' Currency in which amount is set
#' @param invoice_limit int32.
#' Number of invoices to raise during subscription to this plan. Can be overridden by specifying an invoice_limit while subscribing.
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
create_plan <- function(authorization, ...){
  POST(urls$plan, authorization, body = list(...))
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
#' @param perPage int32.
#' Specify how many records you want to retrieve per page
#' @param page int32.
#' Specify exactly what page you want to retrieve
#' @param interval string.
#' Filter list by plans with specified interval
#' @param amount string.
#' Filter list by plans with specified amount (in kobo)
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
list_plans <- function(authorization, ...){
  GET(urls$plan, authorization, body = list(...))
}


#' Update Plan
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param plan_id
#' @param ... Body Params
#' @param amount int32.
#' Amount to be charged in kobo
#' @param interval string.
#' Interval in words. Valid intervals are hourly, daily, weekly, monthly,biannually, annually.
#' @param name string.
#' Name of plan
#' @param description string.
#' Short description of plan
#' @param send_invoices boolean.
#' Set to false if you don't want invoices to be sent to your customers
#' @param send_sms boolean.
#' Set to false if you don't want text messages to be sent to your customers
#' @param currency string.
#' Currency in which amount is set
#' @param invoice_limit int32.
#' Number of invoices to raise during subscription to this plan. Can be overridden by specifying an invoice_limit while subscribing.
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
    PUT(authorization, body = list(...))
}
