% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/transfer.R
\name{finalize_transfer}
\alias{finalize_transfer}
\title{Finalize Transfers}
\usage{
finalize_transfer(authorization, ...)
}
\arguments{
\item{authorization}{set_keys("", "SECRET_KEY")$secret,
equivalent of "-H Authorization: Bearer SECRET_kEY"}

\item{...}{Body Params}

\item{transfer_code}{string. REQUIRED
Transfer code}

\item{otp}{string. REQUIRED
OTP sent to business phone to verify transfer}
}
\value{

}
\description{
Used to finalize transfer where otp is required.
This step is not required if otp is disabled
}
