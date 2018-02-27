data "template_file" "region" {
  template = "$${filter}"

  vars {
    filter = "${var.regions[var.azurerm_region]}"
  }
}
