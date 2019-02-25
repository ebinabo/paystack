#' Check Pending Charge
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param reference
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


#' Submit Birthdy
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
submit_birthday <- function(authorization, ...){
  POST(urls$charge$birthday, authorization, query = list(...))
}

#' Submit OTP
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
submit_otp <- function(authorization, ...){
  POST(urls$charge$otp, authorization, query = list(...))
}

#' Submit Phone
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
submit_phone <- function(authorization, ...){
  POST(urls$charge$phone, authorization, query = list(...))
}

#' Submit Pin
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
submit_pin <- function(authorization, ...){
  POST(urls$charge$pin, authorization, query = list(...))
}
