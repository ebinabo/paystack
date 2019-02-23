# Ctrl + Shift + S to source script
# might take some time depending on your internet connection

install.packages("purrr")

library(purrr)

c("magrittr", "httr", "stringr") %>% map(install.packages)
