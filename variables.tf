

variable "bqtable_data" {
  type = map(object({
    destination_table_name = string
    data_destination_id    = string
    transfer_job_name      = string
    data_path_template     = string
  }))
}



variable "data_source_id" {
  description = "Contains Data Source Type , ex: GCS,Teradata etc"
  type        = string
  # default     = "google_cloud_storage"
}


variable "encoding" {

  #   default = "UTF8"

}

variable "delimiter" {

  #   default = ","

}

variable "file_format" {
  #   default = "CSV"
}

variable "service_account" {
  type = string

  #   default = "terraform@playpen-e3bd38.iam.gserviceaccount.com"

}
variable "schedule" {

}
