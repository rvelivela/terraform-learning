terraform {
  required_version = ">= 1.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = "glowing-market-513723-t8"
  region  = "us-central1"
}

resource "google_storage_bucket" "demo" {
  name     = "rakesh-tf-demo-bucket-513723"
  location = "US"
}
