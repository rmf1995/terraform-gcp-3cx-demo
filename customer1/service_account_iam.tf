resource "google_service_account" "service_account" {
  account_id   = "${local.customer_name}-service-account"
  display_name = "${local.customer_name} Storage Service Account"
}

resource "google_service_account_key" "key" {
  service_account_id = google_service_account.service_account.account_id
  public_key_type    = "TYPE_X509_PEM_FILE"
}

resource "local_file" "key" {
  content  = base64decode(google_service_account_key.key.private_key)
  filename = "keys/${local.customer_name}.json"
}