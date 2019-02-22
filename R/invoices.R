#' Archive Invoice
#'
#' @param authorization
#' @param ...
#'
#' @return
#'
#' @importFrom httr POST
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
archive_invoice <- function(authorization, invoice_id){
  paste(urls$invoices$archive, invoice_id, sep = "/") %>%
    POST(authorization)
}


#' Create Invoice
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
create_invoice <- function(authorization, ...){
  POST(urls$invoices$base, authorization, query = list(...))
}


#' List Invoices
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
list_invoices <- function(authorization, ...){
  GET(urls$invoices$base, authorization, query = list(...))
}


#' Verify Invoice
#'
#' @param authorization
#' @param invoice_id
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
verify_invoice <- function(authorization, invoice_id){
  paste(urls$invoices$verify, invoice_id, sep = "/") %>%
    GET(authorization)
}


#' View Invoice
#'
#' @param authorization
#' @param invoice_id
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
view_invoice <- function(authorization, invoice_id){
  paste(urls$invoices$base, ZZinvoice_id, sep = "/") %>%
    GET(authorization)
}


#' Send Notification for Payment request
#'
#' @param authorization
#' @param ...
#'
#' @return
#'
#' @importFrom httr POST
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
send_notification <- function(authorization, invoice_id, ...){
  paste(urls$invoices$notify, invoice_id, sep = "/") %>%
     POST(authorization)
}


#' Finalize a Draft Invoice
#'
#' @param authorization
#' @param invoice_id
#' @param ...
#'
#' @return
#'
#' @importFrom magrittr %>%
#' @importFrom httr POST
#' @export
#'
#' @examples
finalize_invoices <- function(authorization, invoice_id, ...){
  paste(urls$invoices$finalize, invoice_id, sep = "/") %>%
    POST(authorization, query = list(...))
}


#' Get Invoice Metrics
#'
#' @param authorization
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
get_invoice_metrics <- function(authorization){
  GET(urls$invoices$totals, authorization)
}


#' Mark as Paid
#'
#' @param authorization
#' @param invoice_id
#' @param ...
#'
#' @return
#'
#' @importFrom httr POST
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
mark_as_paid <- function(authorization, invoice_id, ...){
  paste(urls$invoices$paid, invoice_id, sep = "/") %>%
    POST(authorization, query = list(...))
}


#' Update Invoice
#'
#' @param authorization
#' @param invoice_id
#' @param ...
#'
#' @return
#'
#' @importFrom httr PUT
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
update_invoice <- function(authorization, invoice_id, ...){
  paste(urls$invoices$base, invoice_id, sep = "/") %>%
    PUT(authorization, query = list(...))
}







