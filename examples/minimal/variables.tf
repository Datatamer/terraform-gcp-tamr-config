variable "project_id" {
  default = ""
  type = "string"
}

variable "tamr_instance_name" {
  default = ""
  type = string
}

variable "region_id" {
  default = "us-east1"
  type = string
}

variable "zone_id" {
  default = "us-east1-b"
  type = string
}

variable "service_account" {
  default = ""
  type = string
}

variable "subnet_uri" {
  default = ""
  type = string
}

variable "tamr_instance_internal_ip" {
  default = ""
  type = string
}

variable "bigtable_instance_id" {
  default = ""
  type = string
}

variable "bigtable_cluster_id" {
  default = ""
  type = string
}

variable "dataproc_bucket_name" {
  default = ""
  type = string
}

variable "cloudsql_instance_name" {
  default = ""
  type = string
}

variable "tamr_password" {
  default = ""
  type = string
}

variable "tamr_bucket_name" {
  default = ""
  type = string
}
