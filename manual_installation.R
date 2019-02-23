# Ctrl + Shift + S to source script
# might take some time depending on your internet connection

install.packages("purrr")

library(purrr)

c("magrittr", "httr", "stringr", "devtools", "roxygen2") %>% map(install.packages)

# After sourcing the script, Go to Build tab -> Configure Build tools ... -> tick Generate documentation with roxygen
