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



variable "bqtable_data" {
  type = map(object({
    destination_table_name     = string
    data_destination_id    = string
    transfer_job_name   = string
    data_path_template = string
  }))
}

module "terrafromgcstobq" {
  source                 = "./modules/gcstobigquery"
  project                = local.project
  region                 = local.region
  bqtable_data = var.bqtable_data

}


# module "teradatatobigquery" {
#   source  = "./teradatatobigquery"
#   project = local.project
#   region  = local.region

# }

