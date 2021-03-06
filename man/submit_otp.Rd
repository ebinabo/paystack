% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/charge.R
\name{submit_otp}
\alias{submit_otp}
\title{Submit OTP}
\usage{
submit_otp(authorization, ...)
}
\arguments{
\item{authorization}{set_keys("", "SECRET_KEY")$secret,
equivalent of "-H Authorization: Bearer SECRET_kEY"}

\item{...}{Body Params}

\item{otp}{date. REQUIRED OTP submitted by user}

\item{reference}{string. REQUIRED reference for ongoing transaction}
}
\value{

}
\description{
Submit otp to continue a charge
}
