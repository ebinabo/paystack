#' Charge Authorization
#'
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param amount int32. REQUIRED
#' Amount in kobo
#' @param authorization_code string. REQUIRED
#' Authorization code representing card you want charged
#' @param email string. REQUIRED
#' Customer's email address
#' @param plan string.
#' If transaction is to create a subscription to a predefined plan, provide plan code here.
#' @param quantity float.
#' Used to apply a multiple to the amount returned by the plan code above.
#' @param invoice_limit int32.
#' Number of invoices to raise during the subscription. Overrides invoice_limit set on plan.
#' @param currency string.
#' Currency in which amount should be charged
#' @param metadata object.
#' JSON object. Add a custom_fields attribute which has an array of objects if you would like the fields to be added to your transaction when displayed on the dashboard. Sample: {"custom_fields":[{"display_name":"Cart ID","variable_name":"cart_id","value":"8393"}]}
#' @param subaccount string.
#' The code for the subaccount that owns the payment. e.g. ACCT_8f4s1eq7ml6rlzj
#' @param transaction_charge int32.
#' A flat fee to charge the subaccount for this transaction, in kobo. This overrides the split percentage set when the subaccount was created. Ideally, you will need to use this if you are splitting in flat rates (since subaccount creation only allows for percentage split). e.g. 7000 for a 70 naira flat fee.
#' @param bearer string.
#' Who bears Paystack charges? account or subaccount.
#' @param queue boolean.
#' If you are making a scheduled charge call, it is a good idea to queue them so the processing system does not get overloaded causing transaction processing errors. Send queue:true to take advantage of our queued charging.
#'
#' @details This will only work for authorizations with for which reusable is true
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
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param amount int32. REQUIRED
#' Amount in kobo
#' @param authorization_code string. REQUIRED
#' Authorization code representing card you want charged
#' @param email string. REQUIRED
#' Customer's email address
#' @param currency string.
#' A currency for the amount we want to check
#'
#' @details In test mode, we will return insufficient funds for an amount greater than or equal 500,000 naira.
#' This endpoint will only work for authorizations with for which brand is mastercard or visa
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
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param from date.
#' Lower bound of date range. Leave undefined to show totals from day one.
#' @param to date.
#' Upper bound of date range. Leave undefined to show totals till date.
#' @param settled boolean.
#' Set to true to export only settled transactions. false for pending transactions. Leave undefined to export all transactions
#' @param payment_page int32.
#' Specify a payment page's id to export only transactions conducted on said page
#' @param customer int32.
#' @param currency string.
#' @param settlement int32.
#' An ID for the settlement whose transactions we should export
#' @param amount int32.
#' Amount for transactions to export
#' @param status string.
#' Status for transactions to export
#'
#' @details Note that all timestamps are in GMT.
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
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param id int32. REQUIRED Path Param.
#' An ID for the transaction to fetch
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
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param amount int32. REQUIRED
#' Amount in kobo
#' @param email string. REQUIRED
#' Customer's email address
#' @param reference string.
#' Unique transaction reference. Only -,., = and alphanumeric characters allowed. Ensure that this is stored in your database and not a session so that you can use it to verify the transaction
#' @param callback_url string.
#' Fully qualified url, e.g. http://example.com/ . Use this to override the callback url provided on the dashboard for this transaction
#' @param plan string.
#' If transaction is to create a subscription to a predefined plan, provide plan code here.
#' @param quantity float.
#' Used to apply a multiple to the amount returned by the plan code above.
#' @param invoice_limit int32.
#' Number of invoices to raise during the subscription. Overrides invoice_limit set on plan.
#' @param metadata object.
#' @param metadata.cancel_action string.
#' URL customer is redirected to if the cancel button is clicked. NB:This should be a key in the metadata object.
#' @param subaccount string.
#' The code for the subaccount that owns the payment. e.g. ACCT_8f4s1eq7ml6rlzj
#' @param transaction_charge int32.
#' A flat fee to charge the subaccount for this transaction, in kobo. This overrides the split percentage set when the subaccount was created. Ideally, you will need to use this if you are splitting in flat rates (since subaccount creation only allows for percentage split). e.g. 7000 for a 70 naira flat fee.
#' @param bearer string.
#' Who bears Paystack charges? account or subaccount.
#' @param channels array of strings.
#' Send us 'card' or 'bank' or 'card','bank' as an array to specify what options to show the user paying
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
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param perPage int32.
#' Specify how many records you want to retrieve per page
#' @param page int32.
#' Specify exactly what page you want to retrieve
#' @param customer int32.
#' Specify an ID for the customer whose transactions you want to retrieve
#' @param status string.
#' Filter transactions by status ('failed', 'success', 'abandoned')
#' @param from date-time.
#' A timestamp from which to start listing transaction e.g. 2016-09-24T00:00:05.000Z, 2016-09-21
#' @param to date-time.
#' A timestamp at which to stop listing transaction e.g. 2016-09-24T00:00:05.000Z, 2016-09-21
#' @param amount int32.
#' Filter transactions by amount. Specify the amount in kobo.
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
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param amount int32. REQUIRED
#' Amount in kobo
#' @param authorization_code string. REQUIRED
#' Authorization code representing card you want charged
#' @param email string. REQUIRED
#' Customer's email address
#' @param reference string.
#' Unique transaction reference. Only -,., = and alphanumeric characters allowed. Ensure that this is stored in your database and not a session so that you can use it to verify the transaction
#' @param currency string.
#' Currency in which amount should be charged
#' @param metadata object.
#' JSON object. Add a custom_fields attribute which has an array of objects if you would like the fields to be added to your transaction when displayed on the dashboard. Sample: {"custom_fields":[{"display_name":"Cart ID","variable_name":"cart_id","value":"8393"}]}
#'
#'
#' @details Do a redirect to the reauthorization URL received from calling this endpoint. This URL is valid for one time use and expires in 2 hours, so ensure that your customer is on standby to conclude the transaction.
#' When the payment is successful, we will send an event to your webhook url.
#' If you use a test secret key, we will call your test webhook url, otherwise, we'll call your live webhook url.
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
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param ... Body Params
#' @param from date.
#' Lower bound of date range. Leave undefined to show totals from day one.
#' @param to date.
#' Upper bound of date range. Leave undefined to show totals till date.
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
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param reference string. REQUIRED Path Param.
#' Unique transaction reference that exists in your account
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
#' @param authorization set_keys("", "SECRET_KEY")$secret,
#' equivalent of "-H Authorization: Bearer SECRET_kEY"
#' @param id int32. REQUIRED Path Param.
#' An ID for the transaction to fetch
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
