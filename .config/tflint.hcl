plugin "azurerm" {
  enabled = true
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
  version = "0.32.0"

  signature = "pgp" // Verify via PGP, not GitHub attestation
}

config {
  call_module_type = "local"
  force = false
  disabled_by_default = false
  plugin_dir = "~/.tflint.d/plugins"

  varfile = ["terraform.tfvars.ci"]
}

rule "terraform_deprecated_interpolation" {
  enabled = true
}

rule "terraform_deprecated_index" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}

rule "terraform_comment_syntax" {
  enabled = true
}

rule "terraform_documented_outputs" {
  enabled = true
}

rule "terraform_documented_variables" {
  enabled = true
}

rule "terraform_typed_variables" {
  enabled = true
}

rule "terraform_module_pinned_source" {
  enabled = true
}

# Disabled for examples code with unfixed version
rule "terraform_module_version" {
  enabled = false
  exact = false # default
}

rule "terraform_naming_convention" {
  enabled = true
}

rule "terraform_required_version" {
  enabled = true
}

rule "terraform_required_providers" {
  enabled = true
}

rule "terraform_unused_required_providers" {
  enabled = true
}

# Disabled since we have files like "variables-xxxx.tf" instead of a single "variables.tf"
rule "terraform_standard_module_structure" {
  enabled = false
}

rule "azurerm_resources_missing_prevent_destroy" {
  enabled = true
  exclude = [
    "azurerm_storage_account",
    "azurerm_storage_blob",
    "azurerm_storage_container",
    "azurerm_storage_queue",
    "azurerm_storage_share",
    "azurerm_storage_share_directory",
    "azurerm_storage_share_file",
    "azurerm_storage_table",
  ] # Don't check storage resources
}

# Disabled because auto_heal_setting is rendered via a dynamic block which tflint cannot statically analyse
rule "azurerm_app_service_missing_auto_heal_setting" {
  enabled = false
}
