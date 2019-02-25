#' Check Pending Charge
#'
#' When you get "pending" as a charge status or if there was an exception when calling any of the /charge endpoints, wait 10 seconds or more, then make a check to see if its status has changed. Don't call too early as you may get a lot more pending than you should.
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param reference string. REQUIRED
#' The reference to check
#'
#' @return
#'
#' @importFrom magrittr %>%
#' @importFrom httr GET
#' @export
#'
#' @examples
check_pending_charge <- function(authorization, reference){
  paste(urls$charge$base, reference, sep = "/") %>%
    GET(authorization)
}


#' Submit Birthday
#'
#' @description  Submit birthday when requested
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param birthday date. REQUIRED Birthday submitted by user
#' @param reference string. REQUIRED reference for ongoing transaction
#'
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
submit_birthday <- function(authorization, ...){
  POST(urls$charge$birthday, authorization, body = list(...))
}

#' Submit OTP
#'
#' @description Submit otp to continue a charge
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param otp date. REQUIRED OTP submitted by user
#' @param reference string. REQUIRED reference for ongoing transaction
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
submit_otp <- function(authorization, ...){
  POST(urls$charge$otp, authorization, body = list(...))
}

#' Submit Phone
#'
#' @description Submit phone when requested
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param phone string. REQUIRED Phone submitted by user
#' @param reference string. REQUIRED reference for ongoing transaction
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
submit_phone <- function(authorization, ...){
  POST(urls$charge$phone, authorization, body = list(...))
}

#' Submit Pin
#'
#' @description Submit pin to continue a charge
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param pin string. REQUIRED PIN submitted by user
#' @param reference string. REQUIRED reference for transaction that requested pin
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
submit_pin <- function(authorization, ...){
  POST(urls$charge$pin, authorization, body = list(...))
}
