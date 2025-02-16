terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.20.0"
    }
  }
}

locals {
  creds = jsondecode(file(var.credentials))
  project_id = local.creds.project_id
}


provider "google" {
  credentials = file(var.credentials)
  project     = local.project_id
  region      = var.region
}

resource "google_storage_bucket" "hdc_bucket" {
  name          = var.gcs_bucket_name
  location      = var.location
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "hdc_dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.location
}