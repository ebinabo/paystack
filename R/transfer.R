#' Create Transfer Recipient
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
create_transfer_recipient <- function(authorization, ...){
  GET(urls$transfer$recipient, authorization, query = list(...))
}


#' Delete Transfer Recipients
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param recipient_id
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
#' @param recipient_id
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
fetch_transfer <- function(authorization, recipient_id){
  paste(urls$transfer$base, recipient_id, sep = "/") %>%
    GET(authorization)
}


#' Finalize Disabling OTP requirement for Transfer
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
finalize_disable_otp <- function(authorization, ...){
  POST(urls$transfer$disable_otp_req, authorization, query = list(...))
}


#' Finalize Transfers
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
fetch_transfer <- function(authorization, ...){
  POST(urls$transfer$finalize, authorization, query = list(...))
}


#' Initiate Bulk Transfer
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
initiate_bulk_transfer <- function(authorization, ...){
  POST(urls$transfer$base, authorization, query = list(...))
}


#' Initiate Transfer
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
initiate_transfer <- function(authorization, ...){
  POST(urls$transfer$base, authorization, query = list(...))
}



#' List Transfer Recipients
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
list_transfer_recipients <- function(authorization, ...){
  GET(urls$transfer$recipient, authorization, query = list(...))
}


#' List Transfers
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
list_transfer_recipients <- function(authorization, ...){
  GET(urls$transfer$base, authorization, query = list(...))
}


#' Resend OTP for Transfer
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
resend_otp <- function(authorization, ...){
  POST(urls$transfer$resend_otp, authorization, query = list(...))
}



#' Update Transfer Recipients
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param recipient_id
#' @param ... Body Params
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
    PUT(authorization, query = list(...))
}

