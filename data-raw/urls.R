base_url <- "https://api.paystack.co"

# nested list of currently available urls
urls <- list(
  balance = paste(base_url, "balance", sep = "/"),
  bank = list(
    base = paste(base_url, "bank", sep = "/"),
    resolve_acc_no = paste(base_url, "bank", "resolve", sep = "/"),
    resolve_bvn = paste(base_url, "bank", "resolve_bvn", sep = "/")
  ),
  bulkcharge = list(
    base = paste(base_url, "bulkcharge", sep = "/"),
    pause = paste(base_url, "bulkcharge", "pause", sep = "/"),
    resume = paste(base_url, "bulkcharge", "resume", sep = "/")
  ),
  charge = list(
    base = paste(base_url, "charge", sep = "/"),
    pin = paste(base_url, "charge", "submit_pin", sep = "/"),
    otp = paste(base_url, "charge", "submit_otp", sep = "/"),
    phone = paste(base_url, "charge", "submit_phone", sep = "/"),
    birthday = paste(base_url, "charge", "submit_birthday", sep = "/")
  ),
  customer = list(
    base = paste(base_url, "customer", sep = "/"),
    set_risk_action = paste(base_url, "customer", "set_risk_action", sep = "/"),
    del_auth = paste(base_url, "customer", "deactivate_authorization", sep = "/")
  ),
  integration = list(
    payment_session_timeout = paste(base_url, "integration", "payment_session_timeout", sep = "/")
  ),
  invoices = list(
    base = paste(base_url, "paymentrequest", sep = "/"),
    notify = paste(base_url, "paymentrequest", "notify", sep = "/"),
    verify = paste(base_url, "paymentrequest", "verify", sep = "/"),
    totals = paste(base_url, "paymentrequest", "totals", sep = "/"),
    finalize = paste(base_url, "paymentrequest", "finalize", sep = "/"),
    archive = paste(base_url, "paymentrequest", "archive", sep = "/"),
    paid = paste(base_url, "paymentrequest", "mark_as_paid", sep = "/")
  ),
  page = list(
    base = paste(base_url, "page", sep = "/"),
    check = paste(base_url, "page", "check_slug_availability", sep = "/")
  ),
  plan = paste(base_url, "plan", sep = "/"),
  refund = paste(base_url, "refund", sep = "/"),
  resolve_card = paste(base_url, "decision", "bin", sep = "/"),
  resolve_phone = paste(base_url, "verifications", sep = "/"),
  settlement = paste(base_url, "settlement", sep = "/"),
  subaccount = paste(base_url, "subaccount", sep = "/"),
  subscription = list(
    base = paste(base_url, "subscription", sep = "/"),
    enable = paste(base_url, "subscription", "enable", sep = "/"),
    disable = paste(base_url, "subscription", "disable", sep = "/")
  ),
  transaction = list(
    base = paste(base_url, "transaction", sep = "/"),
    verify = paste(base_url, "transaction", "verify", sep = "/"),
    totals = paste(base_url, "transaction", "totals", sep = "/"),
    export = paste(base_url, "transaction", "export", sep = "/"),
    init = paste(base_url, "transaction", "initialize", sep = "/"),
    timeline = paste(base_url, "transaction", "timeline", sep = "/"),
    check_auth = paste(base_url, "transaction", "check_authorization", sep = "/"),
    charge_auth = paste(base_url, "transaction", "charge_authorization", sep = "/"),
    req_reauth = paste(base_url, "transaction", "request_reauthorization", sep = "/")
  ),
  transfer = list(
    base = paste(base_url, "transfer", sep = "/"),
    finalize = paste(base_url, "transfer", "finalize_transfer", sep = "/"),
    resend_otp = paste(base_url, "transfer", "resend_otp", sep = "/"),
    disable_otp_req = paste(base_url, "transfer", "disable_otp", sep = "/"),
    enable_otp_req = paste(base_url, "transfer", "enable_otp", sep = "/"),
    finalize_disable_otp_req = paste(base_url, "transfer", "disable_otp_finalize", sep = "/"),
    recipient = paste(base_url, "transferrecipient", sep = "/")
  )
)

# character vector of all available urls
available_urls <- url %>% flatten() %>% flatten_chr() %>% sort()

# create rda files for data to export, include overwrite = T arg to overwrite
use_data(urls, overwrite = T)
use_data(available_urls, overwrite = T)





