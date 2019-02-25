#' Exchange Rate
#'
#' @param amount
#' @param base_currency
#' @param quote_currency
#'
#' @description Returns the current exchange rate of base_currency/quote_currency
#'
#' @importFrom magrittr %>%
#' @importFrom httr content GET
#' @return
#'
#' @examples USDNGN <- exchange_rate(1, "USD", "NGN")
exchange_rate <- function(amount = 1.00, base_currency, quote_currency){
  # alpha vantage api key
  AV_key <- "T2YK1LUJ2S2GPQ3W"
  base_url <- "https://www.alphavantage.co/query?"

  # query options to get exchange rate
  f1 <- "CURRENCY_EXCHANGE_RATE"
  query_current_rate <- list("function" = f1, from_currency = base_currency,
                             to_currency = quote_currency, apikey = AV_key)

  # set connection to AV and pull content and store in symbol
  GET(base_url, query = query_current_rate) %>% content() -> symbol

  # symbol returns 1 nested list with pair data as list items within symbol
  symbol$`Realtime Currency Exchange Rate` -> symbol_info

  # change pair rate from character to double
  rate <- symbol_info[[5]] %>% as.double()

  # trim extra decimals for pairs based on pip value
  ifelse(
    quote_currency %in% c("USD", "GBP", "EUR", "AUD", "NZD", "CHF"),
    value <- format(round(rate * amount, 4), nsmall = 4),
    value <- format(round(rate * amount, 2), nsmall = 2)
  )

  # return result as double
  value %>% as.double()
}
