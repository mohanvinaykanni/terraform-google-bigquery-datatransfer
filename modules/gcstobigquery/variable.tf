# Input variable definitions
# variable "destination_table_name" {
#   description = "Destination Table Name"
#   type        = string
#   default = "terrafrom_gcstobq"
# }


variable "bqtable_data" {
  type = map(object({
    destination_table_name     = string
    data_destination_id    = string
    transfer_job_name   = string
    data_path_template = string
  }))
}

variable "project" {

  type = string
}
variable "region" {

  type = string
}
# variable "zone" {

#   type = string
# }
# variable "credentials" {

#   type = string
# }

variable "data_source_id" {
  description = "Contains Data Source Type , ex: GCS,Teradata etc"
  type        = string
  default     = "google_cloud_storage"
}

# variable "data_destination_id" {
#   description = "Contains Bigquery Database Name"
#   type        = string
#   default     = "dev"
# }

# variable "transfer_job_name" {
#   description = "Name of the Job to Created with"
#   type        = string
#   default = "terrafrom_gcstobq"
# }

variable "encoding" {

  default = "UTF8"

}

variable "delimiter" {

  default = ","

}

variable "file_format" {
  default = "CSV"
}

variable "service_account" {

  default = "terraform@playpen-e3bd38.iam.gserviceaccount.com"

}

variable "database_type" {

  default = "Teradata"

}
