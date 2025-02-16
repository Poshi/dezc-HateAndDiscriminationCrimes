variable "credentials" {
  description = "My Credentials"
  default     = "../my_creds.json"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "BigQuery Dataset Name for HDC"
  default     = "hdc_dataset"
}

variable "gcs_bucket_name" {
  description = "Storage Bucket Name for HDC"
  default     = "hdc_bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}