output "location" {
  value = "${data.template_file.region.rendered}"
}
