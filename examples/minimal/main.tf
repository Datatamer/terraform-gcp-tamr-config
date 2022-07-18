module "minimal" {
  source = "../../"

  # tamr VM
  tamr_instance_project = var.project_id
  tamr_instance_name            = var.tamr_instance_name
  tamr_instance_zone            = var.zone_id
  tamr_instance_subnet          = var.subnet_uri
  tamr_instance_service_account = var.service_account.email
  tamr_instance_internal_ip     = var.tamr_instance_internal_ip
  # bigtable config
  tamr_bigtable_project_id  = var.project_id
  tamr_bigtable_instance_id = var.bigtable_instance_id
  tamr_bigtable_cluster_id  = var.bigtable_cluster_id
  tamr_bigtable_min_nodes   = 1
  tamr_bigtable_max_nodes   = 60
  # dataproc
  tamr_dataproc_project_id = var.project_id
  tamr_dataproc_bucket     = var.dataproc_bucket_name
  tamr_dataproc_region     = var.region_id
  # dataproc_cluster_config
  tamr_dataproc_cluster_subnetwork_uri = var.subnet_uri
  tamr_dataproc_cluster_zone = var.zone_id
  # cloud sql
  tamr_cloud_sql_project  = var.project_id
  tamr_cloud_sql_location = var.region_id
  tamr_cloud_sql_name     = var.cloudsql_instance_name
  tamr_sql_password       = var.tamr_password
  # filesystem
  tamr_filesystem_bucket = var.tamr_bucket_name
}

