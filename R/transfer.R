#' Create Transfer Recipient
#'
#' @description Creates a new recipient. A duplicate account number will lead to the retrieval of the existing record.
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param account_number string. Required if type is nuban
#' @param bank_code string. Required
#' if type is nuban. You can get the list of Bank Codes by calling the List Banks endpoint.
#' @param name string. REQUIRED
#' A name for the recipient
#' @param type string. REQUIRED
#' nuban / authorization
#' @param metadata object.
#' Store additional information about your recipient in a structured format. JSON
#' @param currency string.
#' Currency for the account receiving the transfer.
#' @param description string.
#' Short desscription if necessary
#' @param authorization_code string.
#' An authorization code from a previous transaction
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
create_transfer_recipient <- function(authorization, ...){
  GET(urls$transfer$recipient, authorization, body = list(...))
}


#' Delete Transfer Recipients
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param recipient_id string. REQUIRED
#' Code or ID for transfer recipient we want to update.
#'
#' @return
#'
#' @importFrom httr DELETE
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
delete_transfer_recipients <- function(authorization, recipient_id){
  paste(urls$transfer$recipient, recipient_id, sep = "/") %>%
    DELETE(authorization)
}


#' Disable OTP requirement for Transfer
#'
#' @description  In the event that you want to be able to complete transfers programmatically without use of OTPs, this endpoint helps disable that….with an OTP. No arguments required. You will get an OTP.
#'
#' @details In the event that you want to be able to complete transfers programmatically without use of OTPs, this endpoint helps disable that….with an OTP. No arguments required. An OTP is sent to you on your business phone.
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
disable_otp <- function(authorization){
  POST(urls$transfer$disable_otp_req, authorization)
}


#' Enable OTP requirement for Transfer
#'
#' @description In the event that a customer wants to stop being able to complete transfers programmatically, this endpoint helps turn OTP requirement back on. No arguments required.
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
enable_otp <- function(authorization){
  POST(urls$transfer$enable_otp_req, authorization)
}


#' Fetch Transfers
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param transfer_id string. REQUIRED
#' An ID or code for the transfer whose details you want to retrieve.
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
fetch_transfer <- function(authorization, transfer_id){
  paste(urls$transfer$base, transfer_id, sep = "/") %>%
    GET(authorization)
}


#' Finalize Disabling OTP requirement for Transfer
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param otp string. REQUIRED
#' OTP sent to business phone to verify disabling OTP requirement
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
finalize_disable_otp <- function(authorization, ...){
  POST(urls$transfer$disable_otp_req, authorization, body = list(...))
}


#' Finalize Transfers
#'
#' @description Used to finalize transfer where otp is required.
#' This step is not required if otp is disabled
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param transfer_code string. REQUIRED
#' Transfer code
#' @param otp string. REQUIRED
#' OTP sent to business phone to verify transfer
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
finalize_transfer <- function(authorization, ...){
  POST(urls$transfer$finalize, authorization, body = list(...))
}


#' Initiate Bulk Transfer
#'
#' @description You need to disable the Transfers OTP requirement to use this endpoint.
#'
#' @details Status of transfer object returned will be ‘pending’ if OTP is disabled. In the event that an OTP is required, status will read ‘otp’.
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Param
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
#' list(
#'   currency = "NGN",
#'   source = "balance",
#'   transfers = data.frame(
#'     amount = rep(50000, 2),
#'     recipient = paste("RCP", c("db342dvqvz9qcrn", "db342dvqvz9qcrn2"), sep = "_"))
#'   ) %>% toJSON(pretty = T)
initiate_bulk_transfer <- function(authorization, ...){
  POST(urls$transfer$base, authorization, body = list(...))
}


#' Initiate Transfer
#'
#' @description Status of transfer object returned will be ‘pending’ if OTP is disabled. In the event that an OTP is required, status will read ‘otp’.
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param amount int32. REQUIRED
#' Amount to transfer in kobo
#' @param recipient string. REQUIRED
#' Code for transfer recipient
#' @param source string. REQUIRED
#' Where should we transfer from? Only balance for now
#' @param currency string
#' @param reason string
#' @param reference string
#' If specified, the field should be a unique identifier (in lowercase) for the object. Only -,_ and alphanumeric characters allowed.
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
initiate_transfer <- function(authorization, ...){
  POST(urls$transfer$base, authorization, body = list(...))
}



#' List Transfer Recipients
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
list_transfer_recipients <- function(authorization, ...){
  GET(urls$transfer$recipient, authorization, body = list(...))
}


#' List Transfers
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
list_transfer_recipients <- function(authorization, ...){
  GET(urls$transfer$base, authorization, body = list(...))
}


#' Resend OTP for Transfer
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param transfer_code string. REQUIRED Transfer code
#' @param reason string. REQUIRED either resend_otp or transfer
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
resend_otp <- function(authorization, ...){
  POST(urls$transfer$resend_otp, authorization, body = list(...))
}



#' Update Transfer Recipients
#'
#' @description Updates an existing recipient
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param recipient_id string. REQUIRED
#' Code or ID for transfer recipient we want to update.
#' @param ... Body Params
#' @param name string. REQUIRED
#' A name for the recipient
#' @param email string.
#' The email address of the recipient
#'
#' @return
#'
#' @importFrom httr PUT
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
update_transfer_recipients <- function(authorization, recipient_id, ...){
  paste(urls$transfer$recipient, recipient_id, sep = "/") %>%
    PUT(authorization, body = list(...))
}

