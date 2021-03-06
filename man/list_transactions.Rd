% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/transaction.R
\name{list_transactions}
\alias{list_transactions}
\title{List Transactions}
\usage{
list_transactions(authorization, ...)
}
\arguments{
\item{authorization}{set_keys("", "SECRET_KEY")$secret,
equivalent of "-H Authorization: Bearer SECRET_kEY"}

\item{...}{Body Params}

\item{perPage}{int32.
Specify how many records you want to retrieve per page}

\item{page}{int32.
Specify exactly what page you want to retrieve}

\item{customer}{int32.
Specify an ID for the customer whose transactions you want to retrieve}

\item{status}{string.
Filter transactions by status ('failed', 'success', 'abandoned')}

\item{from}{date-time.
A timestamp from which to start listing transaction e.g. 2016-09-24T00:00:05.000Z, 2016-09-21}

\item{to}{date-time.
A timestamp at which to stop listing transaction e.g. 2016-09-24T00:00:05.000Z, 2016-09-21}

\item{amount}{int32.
Filter transactions by amount. Specify the amount in kobo.}
}
\value{

}
\description{
List Transactions
}
