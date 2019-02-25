#' Resolve Phone Number
#'
#' @description Using the Truecaller API you can verify the authenticity of a customer. It returns the customer's name, phone number, email, social media handles and organization as available on their Truecaller profile.
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param verification_type string. REQUIRED
#' @param phone string. REQUIRED
#' Customer phone number starting with country code (without the + prefix)
#' @param callback_url string. REQUIRED
#' Link on server to receive the truecaller details
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
resolve_phone_number <- function(authorization, ...){
  POST(urls$resolve_phone, authorization, query = list(...))
}
