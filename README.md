# Azure regions module
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/regions/azurerm/)

This Terraform module is designed to help in using the AzureRM terraform provider.

It provides for an Azure region given in standard format, CLI format or slug format (used by Claranet tfwrapper) the 
Azure standard format, a short format used for resource naming, the CLI format and a slug format.

It also provides the [paired region](https://docs.microsoft.com/en-us/azure/availability-zones/cross-region-replication-azure) associated to the current one.

Please refer to the [regions.tf](regions.tf) file for available regions.
Complete regions mapping is also available in [REGIONS.md](REGIONS.md) documentation.

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 5.x.x       | 0.15.x & 1.0.x    | >= 2.0          |
| >= 4.x.x       | 0.13.x            | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = "eu-west"
}

```

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azure\_region | Azure Region standard name, CLI name or slug format | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| location | Azure region in standard format |
| location\_cli | Azure region in Azure CLI name format |
| location\_short | Azure region in short format for resource naming purpose |
| location\_slug | Azure region in slug format |
| paired\_location | Azure paired region with the current one. All formats available as attributes. |
<!-- END_TF_DOCS -->

## Related documentation

Azure regions: [azure.microsoft.com/en-us/global-infrastructure/regions/](https://azure.microsoft.com/en-us/global-infrastructure/regions/)
