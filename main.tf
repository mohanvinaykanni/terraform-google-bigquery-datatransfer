# Local Variables
locals {
  project     = "playpen-e3bd38"
  region      = "europe-central2"
  zone        = "europe-central2-a"
  credentials = "keys.json"
}

# Cloud Provider
provider "google" {
  project     = local.project
  region      = local.region
  zone        = local.zone
  credentials = local.credentials
}


module "terrafromgcstobq" {
  source         = "./modules/gcstobigquery"
  project        = local.project
  region         = local.region
  bqtable_data   = var.bqtable_data
  data_source_id = var.data_source_id
  encoding       = var.encoding
  delimiter      = var.delimiter
  file_format    = var.file_format
  schedule       = var.schedule


}


# module "teradatatobigquery" {
#   source  = "./teradatatobigquery"
#   project = local.project
#   region  = local.region

# }

