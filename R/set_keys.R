#' Set API Keys
#'
#' @param public_key Public Key
#' @param secret_key Secret Key
#'
#' @description Call this function to store API keys in an R object either for test or live modes
#'
#' @return equivalent of -H "Authorization: Bearer SECRET_KEY"
#'
#' @importFrom httr add_headers
#' @importFrom stringr str_glue
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
#' test_keys <- set_keys("pk_test_key", "sk_test_key")
#' live_keys <- set_keys("pk_live_key", "sk_live_key")
#'
set_keys <- function(public_key, secret_key){
  # interactively throw error if keys are not characters
  if(is.character(public_key) == F || is.character(secret_key) == F){
    stop("Please enter keys as characters")
    # Enter Q and press enter to exit browser
  }

  # put keys in a named list
  keys <- list(public = public_key, secret = secret_key)

  # create another list which contain 2 named <request> objects
  auth <- list(
    secret = str_glue("Bearer {keys$secret}") %>%
      add_headers(Authorization = .),
    public = str_glue("Bearer {keys$public}") %>%
      add_headers(Authorization = .)
  )

  # return auth
  auth
}
