locals {
  tamr_dataproc_cluster_zone            = var.tamr_dataproc_cluster_zone == "" ? var.tamr_instance_zone : var.tamr_dataproc_cluster_zone
  tamr_dataproc_cluster_subnetwork_uri  = var.tamr_dataproc_cluster_subnetwork_uri == "" ? var.tamr_instance_subnet : var.tamr_dataproc_cluster_subnetwork_uri
  tamr_dataproc_cluster_service_account = var.tamr_dataproc_cluster_service_account == "" ? var.tamr_instance_service_account : var.tamr_dataproc_cluster_service_account

  tamr_es_apihost = var.tamr_es_apihost == "" ? "${var.tamr_instance_ip}:9200" : var.tamr_es_apihost
  remote_es       = var.tamr_es_apihost == "" ? false : true

  tamr_bigtable_project_id = var.tamr_bigtable_project_id == "" ? var.tamr_instance_project : var.tamr_bigtable_project_id
  tamr_cloud_sql_project   = var.tamr_cloud_sql_project == "" ? var.tamr_instance_project : var.tamr_cloud_sql_project
  tamr_dataproc_project_id = var.tamr_dataproc_project_id == "" ? var.tamr_instance_project : var.tamr_dataproc_project_id

  dataproc_config  = var.tamr_dataproc_cluster_config == "" ? data.template_file.default_dataproc.rendered : var.tamr_dataproc_cluster_config
  tamr_config      = var.tamr_config == "" ? data.template_file.default_tamr_config.rendered : var.tamr_config
  external_ip      = var.tamr_external_ip == true ? 1 : 0
  spark_properties = var.tamr_spark_properties_override == "" ? file("${path.module}/spark_properties.json") : var.tamr_spark_properties_override
}

data "template_file" "default_dataproc" {
  template = yamlencode("${path.module}/dataproc.yaml.tmpl")
  vars = {
    subnetwork_uri       = local.tamr_dataproc_cluster_subnetwork_uri
    service_account      = local.tamr_dataproc_cluster_service_account
    zone                 = local.tamr_dataproc_cluster_zone
    region               = var.tamr_dataproc_region
    stackdriver_logging  = var.tamr_dataproc_cluster_enable_stackdriver_logging
    version              = var.tamr_dataproc_cluster_version
    tamr_dataproc_bucket = var.tamr_dataproc_bucket

    master_instance_type = var.tamr_dataproc_cluster_master_instance_type
    master_disk_size     = var.tamr_dataproc_cluster_master_disk_size

    worker_machine_type   = var.tamr_dataproc_cluster_worker_machine_type
    worker_num_instances  = var.tamr_dataproc_cluster_worker_num_instances
    worker_num_local_ssds = var.tamr_dataproc_cluster_worker_num_local_ssds

    worker_preemptible_machine_type   = var.tamr_dataproc_cluster_worker_preemptible_machine_type
    worker_preemptible_num_instances  = var.tamr_dataproc_cluster_worker_preemptible_num_instances
    worker_preemptible_num_local_ssds = var.tamr_dataproc_cluster_worker_preemptible_num_local_ssds
  }
}

data "template_file" "default_tamr_config" {
  template = yamlencode("${path.module}/tamr_config.yaml.tmpl")
  vars = {
    tamr_hbase_namespace      = var.tamr_hbase_namespace
    tamr_bigtable_project_id  = local.tamr_bigtable_project_id
    tamr_bigtable_instance_id = var.tamr_bigtable_instance_id
    tamr_bigtable_cluster_id  = var.tamr_bigtable_cluster_id
    tamr_bigtable_min_nodes   = var.tamr_bigtable_min_nodes
    tamr_bigtable_max_nodes   = var.tamr_bigtable_max_nodes
    # dataproc
    tamr_dataproc_project_id = local.tamr_dataproc_project_id
    tamr_dataproc_region     = var.tamr_dataproc_region
    # NOTE: indent does not indent the first line of a variable, so we prefix it
    # with a new file
    tamr_dataproc_cluster_config = indent(2, "\n${local.dataproc_config}")
    tamr_dataproc_bucket         = var.tamr_dataproc_bucket
    # spark
    tamr_spark_driver_memory      = var.tamr_spark_driver_memory
    tamr_spark_executor_memory    = var.tamr_spark_executor_memory
    tamr_spark_executor_cores     = var.tamr_spark_executor_cores
    tamr_spark_executor_instances = var.tamr_spark_executor_instances
    # ditto, comment about indent() above
    tamr_spark_properties_override = indent(4, "\n${local.spark_properties}")
    # sql
    tamr_cloud_sql_project  = local.tamr_cloud_sql_project
    tamr_cloud_sql_location = var.tamr_cloud_sql_location
    tamr_cloud_sql_name     = var.tamr_cloud_sql_name
    tamr_sql_user           = var.tamr_sql_user
    tamr_sql_password       = var.tamr_sql_password
    # elastic
    remote_es                = local.remote_es
    tamr_es_enabled          = var.tamr_es_enabled
    tamr_es_apihost          = local.tamr_es_apihost
    tamr_es_user             = var.tamr_es_user
    tamr_es_password         = var.tamr_es_password
    tamr_es_ssl_enabled      = var.tamr_es_ssl_enabled
    tamr_es_number_of_shards = var.tamr_es_number_of_shards
    tamr_es_socket_timeout   = var.tamr_es_socket_timeout
    # file system
    tamr_filesystem_bucket = var.tamr_filesystem_bucket
    # miscellaneous
    tamr_license_key  = var.tamr_license_key
    tamr_json_logging = var.tamr_json_logging
  }
}

resource "local_file" "populated_config_file" {
  count    = 1
  filename = "test_config"
  content  = data.template_file.default_tamr_config.rendered
}

resource "local_file" "populated_dataproc_file" {
  count    = 1
  filename = "test_dataproc"
  content  = data.template_file.default_dataproc.rendered
}