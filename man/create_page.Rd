% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/page.R
\name{create_page}
\alias{create_page}
\title{Create Page}
\usage{
create_page(authorization, ...)
}
\arguments{
\item{authorization}{set_keys("", "SECRET_KEY")$secret,
equivalent of "-H Authorization: Bearer SECRET_kEY"}

\item{...}{Body Params}

\item{name}{string. REQUIRED
Name of page}

\item{description}{string.
Short description of page}

\item{amount}{int32.
Default amount you want to accept using this page. If none is set, customer is free to provide any amount of their choice. The latter scenario is useful for accepting donations}

\item{slug}{string.
URL slug you would like to be associated with this page. Page will be accessible at https://paystack.com/pay/[slug]}

\item{redirect_url}{string.
If you would like Paystack to redirect someplace upon successful payment, specify the URL here.}

\item{custom_fields}{array.
If you would like to accept custom fields, specify them here. See sample code for details.}
}
\value{

}
\description{
Create Page
}
