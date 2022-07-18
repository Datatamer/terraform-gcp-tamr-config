output "tamr_config_file" {
  value       = module.minimal.tamr_config_file
  description = "full tamr config file"
}

output "tmpl_dataproc_config" {
  value       = module.minimal.tmpl_dataproc_config
  description = "dataproc config"
}