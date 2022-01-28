resource "google_storage_bucket_iam_member" "member" {
  bucket = local.bucket_name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.service_account.email}"
}