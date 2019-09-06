# Azure regions module

This terraform module is designed to help in using the AzureRM terraform provider.

It converts the Azure region given in slug format (used by Claranet tfwrapper) to the Azure standard format
and a short format used for resource naming.

Please refer to the [regions.tf](regions.tf) file for available regions.

Complete regions mapping is also available here: [https://confluence.fr.clara.net/display/ACP/Azure+Naming+Convention](https://confluence.fr.clara.net/display/ACP/Azure+Naming+Convention)

## Requirements

* [Terraform](https://www.terraform.io/downloads.html) >= 0.12
* [AzureRM Terraform provider](https://www.terraform.io/docs/providers/azurerm/) >= 1.31

## Usage
```hcl
module "azure-region" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/regions.git?ref=vX.X.X"

  azure_region = "eu-west"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| azure\_region | Azure Region in slug format | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| location | Converted Azure region in standard format |
| location\_short | Converted Azure region in short format for resource naming purpose |

## Related documentation

Azure regions [https://azure.microsoft.com/en-us/global-infrastructure/regions/]
