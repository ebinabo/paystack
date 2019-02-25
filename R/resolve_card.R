#' Resolve Card BIN
#'
#' @param card_bin string. REQUIRED
#' First 6 characters of card
#'
#' @description No authorization required
#'
#' @return
#'
#' @importFrom httr GET
#' @export
#'
#' @examples
resolve_card_bin <- function(card_bin){
  paste(urls$resolve_card, card_bin, sep = "/") %>%
    GET()
}
