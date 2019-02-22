GET(urls$bank$base) %>% content() %>% `$`("data") -> list_of_banks

# dataframe of available banks
banks <- data.frame(
  name = map(list_of_banks, "name") %>% flatten_chr(),
  slug = map(list_of_banks, "slug") %>% flatten_chr(),
  code = map(list_of_banks, "code") %>% flatten_chr(),
  payable = map(list_of_banks, "pay_with_bank") %>% flatten_chr(),
  stringsAsFactors = F
)

# dataframe of banks currently supporting the pay with bank feature
pay_with_banks <- banks[which(banks$payable == T),] %>% select(name, code)
rownames(pay_with_banks) <- c() # reset rownames

# create rda files for data to export, include overwrite = T arg to overwrite
use_data(banks)
use_data(pay_with_banks)
