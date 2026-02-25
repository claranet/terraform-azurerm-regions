plugin "azurerm" {
  enabled = true
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
  version = "0.31.1"
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
