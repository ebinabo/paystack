test_cards <- list(
  no_validation = list(
    card_number = 4084084084084081,
    exp_date = "03/21",
    cvv = 408
  ),
  pin_only_validation = list(
    card_number = 507850785078507812,
    exp_date = "03/21",
    cvv = 081,
    pin = 1111
  ),
  simulated_error_msg = list(
    error_001 = list(
      error_message = "Declined",
      card_number = 4084080000005408,
      exp_date = "03/21",
      CVV = 001
    ),
    error_002 = list(
      error_message = "Token Not Generated. Customer Not Registered on Token Platform",
      card_number = 507850785078507853,
      exp_date = "03/21",
      cvv = 082,
      pin = sample(1000:9999, 1) # any pin
    )
  ),
  simulated_issues = list(
   issue_003 = list(
     issue = "Timeout error",
     card_number = 5060660000000064,
     exp_date = "03/21",
     CVV = 606
   ),
   issue_004 = list(
     issue = "500 error",
     card_number = 506066506066506067,
     exp_date = "03/21",
     cvv = 060
   )
  )
)

use_data(test_cards)









