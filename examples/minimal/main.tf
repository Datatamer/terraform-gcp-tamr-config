module "minimal" {
  source = "../../"

  # tamr VM
  tamr_instance_project         = "project_id"
  tamr_instance_name            = "<tamr_instance_name>"
  tamr_instance_zone            = "us-east1-b"
  tamr_instance_subnet          = "<subnet_uri>"
  tamr_instance_service_account = "<service_account_email>"
  tamr_instance_internal_ip     = "<tamr_instance_internal_ip>"
  # bigtable config
  tamr_bigtable_project_id  = "<project_id>"
  tamr_bigtable_instance_id = "<bigtable_instance_id>"
  tamr_bigtable_cluster_id  = "<bigtable_cluster_id>"
  tamr_bigtable_min_nodes   = 1
  tamr_bigtable_max_nodes   = 60
  # dataproc
  tamr_dataproc_project_id = "<project_id>"
  tamr_dataproc_bucket     = "<dataproc_bucket_name>"
  tamr_dataproc_region     = "us-east1"
  # dataproc_cluster_config
  tamr_dataproc_cluster_subnetwork_uri = "<subnet_uri>"
  tamr_dataproc_cluster_zone           = "us-east1-b"
  # cloud sql
  tamr_cloud_sql_project  = "<project_id>"
  tamr_cloud_sql_location = "us-east1"
  tamr_cloud_sql_name     = "<cloudsql_instance_name>"
  tamr_sql_password       = "<tamr_password>"
  # filesystem
  tamr_filesystem_bucket = "<bucket_name>"
}
