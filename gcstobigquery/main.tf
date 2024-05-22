
# Data Transfer from GCS to Bigquery
resource "google_bigquery_data_transfer_config" "terrafromgcstobq" {
  data_refresh_window_days  = 0
  data_source_id            = var.data_source_id
  destination_dataset_id    = var.data_destination_id
  disabled                  = false
  display_name              = var.transfer_job_name
  location                  = var.region
  notification_pubsub_topic = null
  service_account_name      = var.service_account

  params = {
    "data_path_template"              = "gs://europe-central2-comp1-f38e0806-bucket/data/test1.csv"
    "destination_table_name_template" = var.destination_table_name
    "encoding"                        = var.encoding
    "field_delimiter"                 = var.delimiter
    "file_format"                     = var.file_format
    "max_bad_records"                 = "0"
    "skip_leading_rows"               = "1"
    "write_disposition"               = "APPEND"
  }
  project  = var.project
  schedule = "every 60 minutes" 

  schedule_options {
    disable_auto_scheduling = false
    end_time                = null
    start_time              = timestamp()
  }
}