# Unreleased

Fixed
  * [GITHUB-7](https://github.com/claranet/terraform-azurerm-regions/issues/7): Fix US and Asia regions short names

# v6.1.0 - 2022-11-02

Added
  * [GITHUB-6](https://github.com/claranet/terraform-azurerm-regions/pull/6): Add West US 3 region

# v6.0.0 - 2022-07-08

Changed:
  * AZ-717: Update README and improve CI for Terraform `v1.1` and latest major module version

# v5.1.0 - 2022-04-27

Changed:
  * AZ-728: Remove unnecessary `required_providers` block

# v5.0.1 - 2022-04-13

Fixed:
  * [GITHUB-3](https://github.com/claranet/terraform-azurerm-regions/issues/3): Fix region Australia Southeast short name, cleanup Australia South
  * AZ-720: Add `try()` on outputs

# v5.0.0 - 2022-04-05

Added:
  * AZ-720/[GITHUB-2](https://github.com/claranet/terraform-azurerm-regions/issues/2): Add paired region in outputs

# v3.2.1/v4.2.1 - 2021-11-25

Fixed:
  * [GITHUB-1](https://github.com/claranet/terraform-azurerm-regions/pull/1): Fix region Brazil typo (#1)

# v3.2.0/v4.2.0 - 2021-10-13

Changed:
  * AZ-583: Allow standard name, CLI name or slug format as input
  * AZ-572: Revamp examples and improve CI

# v3.1.1/v4.1.1 - 2020-08-20

Updated:
  * AZ-532: Revamp README with latest `terraform-docs` tool

# v3.1.0/v4.1.0 - 2021-01-08

Added:
  * AZ-419: Add and output also the region in Azure CLI name format

# v3.0.1/v4.0.0 - 2020-10-20

Changed
  * AZ-273: Update README and CI, module compatible Terraform 0.13+ (now requires Terraform 0.12.26 minimum version)

# v2.0.2/v3.0.0 - 2020-04-02

Changed
  * AZ-206: Update README, module compatible both AzureRM provider < 2.0 and >= 2.0

# v2.0.1 - 2019-09-27

Changed
  * AZ-119: Revamp README and publish this module to Terraform registry

Added
  * AZ-119: Add CONTRIBUTING.md doc and `terraform-wrapper` usage with the module

# v2.0.0 - 2019-09-06

Breaking
  * AZ-94: Terraform 0.12 / HCL2 format

Added
  * AZ-118: Add LICENSE, NOTICE & Github badges

# v1.1.0 - 2019-05-06

Changed
  * AZ-88: Normalize `location_short` variable

# v1.0.1 - 2019-01-14

Added
  * AZ-3: Continuous integration & migration on GitLab CI

# v1.0.0 - 2018-07-09

Changed
  * TER-295: Update Azure Regions and add short format.

# v0.0.1 - 2018-03-12

Added
  * First Release
