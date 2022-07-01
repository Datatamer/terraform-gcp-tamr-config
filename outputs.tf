output "tamr_config_file" {
  value       = data.template_file.default_tamr_config.rendered
  description = "full tamr config file"
}

output "tmpl_dataproc_config" {
  value       = data.template_file.default_dataproc.rendered
  description = "dataproc config"
}
