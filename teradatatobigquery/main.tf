
# Data Transfer from Teradata to Bigquery
resource "google_bigquery_data_transfer_config" "teradatatobq" {
  data_refresh_window_days  = 0
  data_source_id            = "on_premises"
  destination_dataset_id    = "dev"
  disabled                  = false
  display_name              = "terraformteradatatobq"
  location                  = var.region
  notification_pubsub_topic = null
  params = {
    "agent_service_account" = var.service_account
    "bucket"                = "europe-central2-comp1-f38e0806-bucket"
    "database_name"         = "HR"
    "database_type"         = var.database_type
    "table_name_patterns"   = ".*"
  }
  project  = var.project
  schedule = "every 24 hours"

  schedule_options {
    disable_auto_scheduling = false
    end_time                = null
    start_time              = timestamp()
  }
}