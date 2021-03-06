% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bulkcharge.R
\name{initiate_bulk_charge}
\alias{initiate_bulk_charge}
\title{Initiate Bulk Charge}
\usage{
initiate_bulk_charge(authorization, reference = "", ...)
}
\arguments{
\item{authorization}{set_keys("", "SECRET_KEY")$secret,
equivalent of "-H Authorization: Bearer SECRET_kEY"}

\item{reference}{string.
A reference for this batch. If it collides with an existing batch reference, we will discard.}

\item{...}{Body Params .example}
}
\value{

}
\description{
Initiate Bulk Charge
}
\examples{
data.frame(
  authorization = c("AUTH_n95vpedf", "AUTH_ljdt4e4j"),
  amount = c(23500, 34000)
) \%>\% toJSON(pretty = T)
}
