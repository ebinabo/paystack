#' Create Subaccount
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param account_number string. REQUIRED
#' NUBAN Bank Account Number
#' @param business_name string. REQUIRED
#' Name of business for subaccount
#' @param percentage_charge float. REQUIRED
#' What is the default percentage charged when receiving on behalf of this subaccount?
#' @param settlement_bank string. REQUIRED
#' Name of Bank (see list of accepted names by calling List Banks)
#' @param primary_contact_email string.
#' A contact email for the subaccount
#' @param primary_contact_name string.
#' A name for the contact person for this subaccount
#' @param primary_contact_phone string.
#' A phone number to call for this subaccount
#' @param metadata string.
#' Stringified JSON object. Sample: {"custom_fields":[{"display_name":"Cart ID","variable_name":"cart_id","value":"8393"}]}
#' @param settlement_schedule string.
#' Any of auto, weekly, monthly, manual. Auto means payout is T+1 and manual means payout to the subaccount should only be made when requested.
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
create_subaccount <- function(authorization, ...){
  POST(urls$subaccount, authorization, body = list(...))
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
list_subaccount <- function(authorization, ...){
  GET(urls$subaccount, authorization, body = list(...))
}


#' Update Subaccount
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param subacct_id
#' @param ... Body Params
#' @param account_number string.
#' NUBAN Bank Account Number
#' @param business_name string.
#' Name of business for subaccount
#' @param percentage_charge float.
#' What is the default percentage charged when receiving on behalf of this subaccount?
#' @param settlement_bank string. REQUIRED
#' Name of Bank (see list of accepted names by calling List Banks)
#' @param description string.
#' A description for this subaccount
#' @param primary_contact_email string.
#' A contact email for the subaccount
#' @param primary_contact_name string.
#' A name for the contact person for this subaccount
#' @param primary_contact_phone string.
#' A phone number to call for this subaccount
#' @param metadata string.
#' Stringified JSON object. Sample: {"custom_fields":[{"display_name":"Cart ID","variable_name":"cart_id","value":"8393"}]}
#' @param settlement_schedule string.
#' Any of auto, weekly, monthly, manual. Auto means payout is T+1 and manual means payout to the subaccount should only be made when requested.
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
    PUT(authorization, body = list(...))
}
