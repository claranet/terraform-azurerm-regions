# README #

This terraform module is designed to help in using the AzureRM terraform provider.

It converts the Azure region given in short format (used by Claranet tfwrapper) to the Azure standard format.
Please refer to the [regions.tf](regions.tf) file for available regions.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| azurerm_region | Azure Region in short format | string | - | yes |
| regions | Azure region mapping between short and standard format. | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| location | Converted Azure region in standard format |
