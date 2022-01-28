resource "google_storage_bucket" "customer-storage" {
  name                        = local.bucket_name
  uniform_bucket_level_access = true
  location                    = "EUROPE-WEST2"
  force_destroy               = true

  lifecycle_rule {
    condition {
      age = 31
    }
    action {
      type          = "SetStorageClass"
      storage_class = "NEARLINE"
    }
  }

  lifecycle_rule {
    condition {
      age = 180
    }
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }
}
output "bucket_name" {
  value       = google_storage_bucket.customer-storage.name
  description = "The bucket name."
}