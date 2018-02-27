output "location" {
  value       = "${data.template_file.region.rendered}"
  description = "Converted Azure region in standard format"
}
