#' Archive Invoice
#'
#' @description Used to archive an invoice. Invoice will no longer be fetched on list or returned on verify.
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param invoice_id Id of invoice to be archived
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
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param amount int32. REQUIRED
#' payment request amount. only useful if line items and tax values are ignored. endpoint will throw a friendly warning if neither is available.
#' @param customer string. REQUIRED
#' customer id or code
#' @param due_date string. REQUIRED
#' ISO 8601 representation of request due date
#' @param description string.
#' A brief description of the invoice
#' @param line_items array of strings.
#' array of line items int the format [{"name":"item 1", "amount":2000}]
#' @param tax array of strings.
#' array of taxes to be charged in the format [{"name":"VAT", "amount":2000}]
#' @param currency string.
#' self explanatory. defaults to NGN
#' @param metadata object.
#' @param send_notification boolean.
#' Indicates whether Paystack sends an email notification to customer. Defaults to true
#' @param draft boolean.
#' Indicate if request should be saved as draft. Defaults to false and overrides send_notification
#' @param has_invoice boolean.
#' Set to true to create a draft invoice (adds an auto incrementing invoice number if none is provided) even if there are no line_items or tax passed
#' @param invoice_number int32.
#' Numeric value of invoice. Invoice will start from 1 and auto increment from there. This field is to help override whatever value Paystack decides. Auto increment for subsequent invoices continue from this point.
#'
#' @return
#'
#' @importFrom httr POST
#' @export
#'
#' @examples
create_invoice <- function(authorization, ...){
  POST(urls$invoices$base, authorization, body = list(...))
}


#' Finalize a Draft Invoice
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param invoice_id
#' @param ... Body Params
#' @param send_notification boolean.
#' Indicates whether Paystack sends an email notification to customer. Defaults to true
#'
#' @return
#'
#' @importFrom magrittr %>%
#' @importFrom httr POST
#' @export
#'
#' @examples
finalize_invoice <- function(authorization, invoice_id, ...){
  paste(urls$invoices$finalize, invoice_id, sep = "/") %>%
    POST(authorization, body = list(...))
}


#' Get Invoice Metrics
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
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


#' List Invoices
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param customer string.
#' Filter by customer ID
#' @param status string.
#' Filter by invoice status
#' @param currency string.
#' Filter by currency
#' @param paid string.
#' @param include_archive string.
#' Show archived invoices
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
list_invoices <- function(authorization, ...){
  GET(urls$invoices$base, authorization, body = list(...))
}


#' Mark as Paid
#'
#' @description This marks an invoice as paid in cases where it was paid offline
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param invoice_id
#' @param ... Body Params
#' @param amount_paid int32. REQUIRED
#' Amount paid by customer
#' @param paid_by string. REQUIRED
#' The email address of the customer
#' @param payment_date string. REQUIRED
#' Date payment was made
#' @param payment_method string. REQUIRED
#' The method of payment which are "Cash", "POS", "Cheque", "Bank Transfer" or "Other"
#' @param note string.
#' An optional note
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
    POST(authorization, body = list(...))
}


#' Send Notification for Payment request
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
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


#' Update Invoice
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param invoice_id
#' @param ... Body Params
#' @param amount int32. REQUIRED
#' payment request amount. only useful if line items and tax values are ignored. endpoint will throw a friendly warning if neither is available.
#' @param customer string. REQUIRED
#' customer id or code
#' @param due_date string. REQUIRED
#' ISO 8601 representation of request due date
#' @param description string.
#' A brief description of the invoice
#' @param line_items array of strings.
#' array of line items int the format [{"name":"item 1", "amount":2000}]
#' @param tax array of strings.
#' array of taxes to be charged in the format [{"name":"VAT", "amount":2000}]
#' @param currency string.
#' self explanatory. defaults to NGN
#' @param metadata object.
#' @param send_notification boolean.
#' Indicates whether Paystack sends an email notification to customer. Defaults to true
#' @param has_invoice boolean.
#' Set to true to create a draft invoice (adds an auto incrementing invoice number if none is provided) even if there are no line_items or tax passed
#' @param invoice_number int32.
#' Numeric value of invoice. Invoice will start from 1 and auto increment from there. This field is to help override whatever value Paystack decides. Auto increment for subsequent invoices continue from this point.

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
    PUT(authorization, body = list(...))
}


#' Verify Invoice
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param invoice_id or code. string. REQUIRED Path params
#'
#' @details Note that a key is added called pending_amount when you fetch an invoice. This is because when paying for an invoice, you can choose to pay part but not all. Whenever a successful transaction is made, the key updates to reveal what’s left of the invoice to pay. As a rule, the UI (frontend, or POS) should not allow payment of an amount greater than the pending amount.
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
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param invoice_id or code. string. REQUIRED Path params
#'
#' @return
#'
#' @importFrom httr GET
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
view_invoice <- function(authorization, invoice_id){
  paste(urls$invoices$base, invoice_id, sep = "/") %>%
    GET(authorization)
}







