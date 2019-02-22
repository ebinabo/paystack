#' Charge Authorization
#'
#' @param authorization
#' @param ...
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
charge_authorization <- function(authorization, ...){
  POST(urls$transaction$charge_auth, authorization, query = list(...))
}


#' Check Authorization
#'
#' @param authorization
#' @param ...
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
check_authorization <- function(authorization, ...){
  GET(urls$transaction$check_auth, authorization, query = list(...))
}


#' Export Transactions
#'
#' @param authorization
#' @param ...
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
export_transactions <- function(authorization, ...){
  GET(urls$transaction$export, authorization, query = list(...))
}


#' Fetch Transaction
#'
#' @param authorization
#' @param id
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
fetch_transaction <- function(authorization, id){
  paste(urls$transaction$base, id, sep = "/") %>%
    GET(authorization)
}


#' Initialize Transaction
#'
#' @param authorization
#' @param ...
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
initialize_transaction <- function(authorization, ...){
  POST(urls$transaction$init, authorization, query = list(...))
}


#' List Transactions
#'
#' @param authorization
#' @param ...
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
list_transactions <- function(authorization, ...){
  GET(urls$transaction$base, authorization, query = list(...))
}


#' Request Reauthorization
#'
#' @param authorization
#' @param ...
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
request_reauthorization <- function(authorization, ...){
  POST(urls$transaction$req_reauth, authorization, query = list(...))
}


#' Transaction Totals
#'
#' @param authorization
#' @param ...
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
transaction_totals <- function(authorization, ...){
  GET(urls$transaction$totals, authorization, query = list(...))
}


#' Verify Transaction
#'
#' @param authorization
#' @param reference
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
verify_transaction <- function(authorization, reference){
  paste(urls$transaction$verify, reference, sep = "/") %>%
    GET(authorization)
}


#' View Transaction Timeline
#'
#' @param authorization
#' @param id
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
view_transaction_timeline <- function(authorization, id){
  paste(urls$transaction$timeline, reference, sep = "/") %>%
    GET(authorization)
}
