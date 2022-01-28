locals {
  customer_name = "customer2"
  machine_type  = "f1-micro"
  bucket_name   = "${local.customer_name}-storage-${lower(random_id.storage_account.hex)}"
}

resource "random_id" "storage_account" {
  byte_length = 8
}


