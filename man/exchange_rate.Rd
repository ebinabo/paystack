% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exchange_rate.R
\name{exchange_rate}
\alias{exchange_rate}
\title{Exchange Rate}
\usage{
exchange_rate(amount = 1, base_currency, quote_currency)
}
\arguments{
\item{quote_currency}{}
}
\value{

}
\description{
Returns the current exchange rate of base_currency/quote_currency
}
\examples{
USDNGN <- exchange_rate(1, "USD", "NGN")
}
