resource "google_storage_bucket" "demo2" {
  name     = "rakesh-tf-demo-bucket-2-513723"
  location = "US"

  uniform_bucket_level_access = true
}
