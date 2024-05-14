# Input variable definitions
variable "destination_table_name_template" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
  default = "terrafrom_gcstobq"
}

variable "data_source_id" {
  description = "Tags to set on the bucket."
  type        = string
  default     = "google_cloud_storage"
}