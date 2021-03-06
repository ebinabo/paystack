% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/transaction.R
\name{charge_authorization}
\alias{charge_authorization}
\title{Charge Authorization}
\usage{
charge_authorization(authorization, ...)
}
\arguments{
\item{authorization}{set_keys("", "SECRET_KEY")$secret,
equivalent of "-H Authorization: Bearer SECRET_kEY"}

\item{...}{Body Params}

\item{amount}{int32. REQUIRED
Amount in kobo}

\item{authorization_code}{string. REQUIRED
Authorization code representing card you want charged}

\item{email}{string. REQUIRED
Customer's email address}

\item{plan}{string.
If transaction is to create a subscription to a predefined plan, provide plan code here.}

\item{quantity}{float.
Used to apply a multiple to the amount returned by the plan code above.}

\item{invoice_limit}{int32.
Number of invoices to raise during the subscription. Overrides invoice_limit set on plan.}

\item{currency}{string.
Currency in which amount should be charged}

\item{metadata}{object.
JSON object. Add a custom_fields attribute which has an array of objects if you would like the fields to be added to your transaction when displayed on the dashboard. Sample: {"custom_fields":[{"display_name":"Cart ID","variable_name":"cart_id","value":"8393"}]}}

\item{subaccount}{string.
The code for the subaccount that owns the payment. e.g. ACCT_8f4s1eq7ml6rlzj}

\item{transaction_charge}{int32.
A flat fee to charge the subaccount for this transaction, in kobo. This overrides the split percentage set when the subaccount was created. Ideally, you will need to use this if you are splitting in flat rates (since subaccount creation only allows for percentage split). e.g. 7000 for a 70 naira flat fee.}

\item{bearer}{string.
Who bears Paystack charges? account or subaccount.}

\item{queue}{boolean.
If you are making a scheduled charge call, it is a good idea to queue them so the processing system does not get overloaded causing transaction processing errors. Send queue:true to take advantage of our queued charging.}
}
\value{

}
\description{
Charge Authorization
}
\details{
This will only work for authorizations with for which reusable is true
}
