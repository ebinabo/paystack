#' Check Available
#'
#' @description Check if an id is available for a particular section of account, type
#'
#' @param id to search for
#' @param type category to check
#' @param ... authorization
#'
#' @return boolean
#' @export
#'
#' @examples is_id_available("se546", "transaction", authorization)
is_id_available <- function(id, type, ...){
  # negate because status returns T when an id is available but
  # the parent function is asking if id is availabe to use
  negate_status <- function(x) x %>% parse_response() %>% `$`(status) %>% `!`
  switch(
    type,
    "bulk_charge_batch" = fetch_bulk_charge_batch(authorization = ..., batch_id = id) %>% negate_status(),
    "customer" = fetch_customer(authorization = ..., customer_code = id) %>% negate_status(),
    "page" = fetch_page(authorization = ..., page_id = id) %>% negate_status(),
    "plan" = fetch_plan(authorization = ..., plan_id = id) %>% negate_status(),
    "refund" = fetch_refund(authorization = ..., trans_id = id) %>% negate_status(),
    "subaccount" = fetch_subaccount(authorization = ..., subacct_id = id) %>% negate_status(),
    "subscription" = fetch_subscription(authorization = ..., id = id) %>% negate_status(),
    "transaction" = fetch_transaction(authorization = ..., id = id) %>% negate_status(),
    "transfer" = fetch_transfer(authorization = ..., transfer_id = id) %>% negate_status()
  )
}
