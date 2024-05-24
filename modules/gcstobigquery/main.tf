
# Data Transfer from GCS to Bigquery
resource "google_bigquery_data_transfer_config" "terrafromgcstobq" {
  for_each               = var.bqtable_data
  data_refresh_window_days  = 0
  data_source_id            = var.data_source_id
  destination_dataset_id    = each.value.data_destination_id
  disabled                  = false
  display_name              = each.value.transfer_job_name
  location                  = var.region
  notification_pubsub_topic = null
  service_account_name      = var.service_account

  params = {
    "data_path_template"              = each.value.data_path_template
    "destination_table_name_template" = each.value.destination_table_name
    "encoding"                        = var.encoding
    "field_delimiter"                 = var.delimiter
    "file_format"                     = var.file_format
    "max_bad_records"                 = "0"
    "skip_leading_rows"               = "1"
    "write_disposition"               = "APPEND"
  }
  project  = var.project
  schedule = var.schedule

  schedule_options {
    disable_auto_scheduling = false
    end_time                = null
    start_time              = timestamp()
  }
}