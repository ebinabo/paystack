% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/invoices.R
\name{list_invoices}
\alias{list_invoices}
\title{List Invoices}
\usage{
list_invoices(authorization, ...)
}
\arguments{
\item{authorization}{set_keys("", "SECRET_KEY")$secret,
equivalent of "-H Authorization: Bearer SECRET_kEY"}

\item{...}{Body Params}

\item{customer}{string.
Filter by customer ID}

\item{status}{string.
Filter by invoice status}

\item{currency}{string.
Filter by currency}

\item{paid}{string.}

\item{include_archive}{string.
Show archived invoices}
}
\value{

}
\description{
List Invoices
}
