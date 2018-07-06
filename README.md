# README #

This terraform module is designed to help in using the AzureRM terraform provider.

It converts the Azure region given in slug format (used by Claranet tfwrapper) to the Azure standard format
and a short format used for resource naming.

Please refer to the [regions.tf](regions.tf) file for available regions.

Complete regions mapping is also available here : [https://confluence.fr.clara.net/display/ACP/Azure+Naming+Convention](https://confluence.fr.clara.net/display/ACP/Azure+Naming+Convention)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| azure_region | Azure Region in slug format | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| location | Converted Azure region in standard format |
| location-short | Converted Azure region in short format for resource naming purpose |
