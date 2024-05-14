
# Local Variables
locals {
  project = "playpen-e3bd38"
  region  = "europe-central2"
  zone    = "europe-central2-a"
  credentials = "keys.json"
}

# Cloud Provider
provider "google" {
  project     = local.project
  region      = local.region
  zone        = local.zone
  credentials = local.credentials
}

# Data Transfer from GCS to Bigquery
resource "google_bigquery_data_transfer_config" "terrafromgcstobq" {
  data_refresh_window_days = 0
  data_source_id           = var.data_source_id
  destination_dataset_id   = "dev"
  disabled                 = false
  display_name             = "terrafromgcstobq"
  location = local.region
  notification_pubsub_topic = null
  params = {
    "data_path_template"              = "gs://europe-central2-comp1-f38e0806-bucket/data/test1.csv"
    "destination_table_name_template" = var.destination_table_name_template
    "encoding"                        = "UTF8"
    "field_delimiter"                 = ","
    "file_format"                     = "CSV"
    "max_bad_records"                 = "0"
    "skip_leading_rows"               = "1"
    "write_disposition"               = "APPEND"
  }
  project  = "playpen-e3bd38"
  schedule = "every 20 minutes"

  schedule_options {
    disable_auto_scheduling = false
    end_time                = null
    start_time              = timestamp()
  }
}
