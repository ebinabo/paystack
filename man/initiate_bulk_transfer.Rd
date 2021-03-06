% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/transfer.R
\name{initiate_bulk_transfer}
\alias{initiate_bulk_transfer}
\title{Initiate Bulk Transfer}
\usage{
initiate_bulk_transfer(authorization, ...)
}
\arguments{
\item{authorization}{set_keys("", "SECRET_KEY")$secret,
equivalent of "-H Authorization: Bearer SECRET_kEY"}

\item{...}{Body Param}
}
\value{

}
\description{
You need to disable the Transfers OTP requirement to use this endpoint.
}
\details{
Status of transfer object returned will be ‘pending’ if OTP is disabled. In the event that an OTP is required, status will read ‘otp’.
}
\examples{
list(
  currency = "NGN",
  source = "balance",
  transfers = data.frame(
    amount = rep(50000, 2),
    recipient = paste("RCP", c("db342dvqvz9qcrn", "db342dvqvz9qcrn2"), sep = "_"))
  ) \%>\% toJSON(pretty = T)
}
