## 7.3.1 (2025-01-24)

### Bug Fixes

* typo in data_residency section, it implies data is stored in UAE when it is actually in the UK a5b3e2a

### Miscellaneous Chores

* **deps:** update tools 7f61371

## 7.3.0 (2025-01-15)

### Features

* add New Zealand North region 3d58615

### Documentation

* update REGIONS.md 39b873d

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.3 e3d9362
* **deps:** update dependency opentofu to v1.8.4 c13a7c3
* **deps:** update dependency opentofu to v1.8.6 2fa9e2d
* **deps:** update dependency opentofu to v1.8.8 f2e1bf3
* **deps:** update dependency opentofu to v1.9.0 ba0ec9b
* **deps:** update dependency pre-commit to v4 e21d81a
* **deps:** update dependency pre-commit to v4.0.1 d49742c
* **deps:** update dependency tflint to v0.54.0 fa7c52f
* **deps:** update dependency tflint to v0.55.0 f5a9f2f
* **deps:** update dependency trivy to v0.56.1 170036d
* **deps:** update dependency trivy to v0.56.2 d09ac66
* **deps:** update dependency trivy to v0.57.1 dbd44e5
* **deps:** update dependency trivy to v0.58.1 c3ffb3e
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.19.0 5fef056
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.20.0 4039716
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v5 de6ea73
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.1.0 4d4da8d
* **deps:** update tools 85ac6a7
* **deps:** update tools f425286
* prepare for new examples structure b9f3c67
* update examples structure 3553459
* update tflint config for v0.55.0 5c6625c

## 7.2.1 (2024-10-03)

### Documentation

* update README badge to use OpenTofu registry 17d8e4e
* update README with `terraform-docs` v0.19.0 056ceb9

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.2 7040ab5
* **deps:** update dependency terraform-docs to v0.19.0 85c393e
* **deps:** update dependency trivy to v0.55.0 2882c94
* **deps:** update dependency trivy to v0.55.1 7495fb0
* **deps:** update dependency trivy to v0.55.2 233fea4
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.17.0 f06fe41
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.18.0 1e808b3
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.3 b0f364d
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.93.0 2be6388
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.0 509304e
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.1 02d4ab1
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.2 b9d7c7c
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.3 342f288
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.95.0 414a874
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.0 d2c01d7
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.1 3417aef

## 7.2.0 (2024-08-23)

### Features

* **AZ-1443:** add data location map b8a1f43

### Continuous Integration

* **AZ-1391:** enable semantic-release [skip ci] 3acd16e
* **AZ-1391:** update semantic-release config [skip ci] 1e13f4b

### Miscellaneous Chores

* **deps:** enable automerge on renovate 82bc489
* **deps:** update dependency opentofu to v1.7.0 2dcc4a4
* **deps:** update dependency opentofu to v1.7.1 9369c08
* **deps:** update dependency opentofu to v1.7.2 05685a1
* **deps:** update dependency opentofu to v1.7.3 353cc97
* **deps:** update dependency opentofu to v1.8.0 c010708
* **deps:** update dependency opentofu to v1.8.1 6d77964
* **deps:** update dependency pre-commit to v3.7.1 a544974
* **deps:** update dependency pre-commit to v3.8.0 ba3b3c7
* **deps:** update dependency terraform-docs to v0.18.0 7d0a381
* **deps:** update dependency tflint to v0.51.0 f350260
* **deps:** update dependency tflint to v0.51.1 5137e7c
* **deps:** update dependency tflint to v0.51.2 83e4f4b
* **deps:** update dependency tflint to v0.52.0 392dc71
* **deps:** update dependency tflint to v0.53.0 20c0388
* **deps:** update dependency trivy to v0.50.2 12e2146
* **deps:** update dependency trivy to v0.50.4 7366b3c
* **deps:** update dependency trivy to v0.51.0 c82850f
* **deps:** update dependency trivy to v0.51.1 c37afe2
* **deps:** update dependency trivy to v0.51.2 0641cdd
* **deps:** update dependency trivy to v0.51.4 01d925e
* **deps:** update dependency trivy to v0.52.0 b7ed2b6
* **deps:** update dependency trivy to v0.52.1 9b2b44a
* **deps:** update dependency trivy to v0.52.2 7cadf36
* **deps:** update dependency trivy to v0.53.0 a2a9030
* **deps:** update dependency trivy to v0.54.1 7c58616
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 321347e
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.1 c48b299
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.2 c262edb
* **deps:** update renovate.json cf45cb7
* **pre-commit:** update commitlint hook bb62f31
* **release:** remove legacy `VERSION` file a97f54e

# v7.1.1 - 2024-03-15

Fixed
  * [GITHUB-11](https://github.com/claranet/terraform-azurerm-regions/issues/11): Fix Japan incorrect paired regions

# v7.1.0 - 2023-11-17

Added
  * [GITHUB-9](https://github.com/claranet/terraform-azurerm-regions/issues/9): Support of qatarcentral region on Azure
  * AZ-1248: Update regions

# v7.0.0 - 2023-10-13

Breaking
  * [GITHUB-7](https://github.com/claranet/terraform-azurerm-regions/issues/7): Fix US and Asia regions short names using ISO 3166 country code

# v6.1.0 - 2022-11-02

Added
  * [GITHUB-6](https://github.com/claranet/terraform-azurerm-regions/pull/6): Add West US 3 region

# v6.0.0 - 2022-07-08

Changed
  * AZ-717: Update README and improve CI for Terraform `v1.1` and latest major module version

# v5.1.0 - 2022-04-27

Changed
  * AZ-728: Remove unnecessary `required_providers` block

# v5.0.1 - 2022-04-13

Fixed
  * [GITHUB-3](https://github.com/claranet/terraform-azurerm-regions/issues/3): Fix region Australia Southeast short name, cleanup Australia South
  * AZ-720: Add `try()` on outputs

# v5.0.0 - 2022-04-05

Added
  * AZ-720/[GITHUB-2](https://github.com/claranet/terraform-azurerm-regions/issues/2): Add paired region in outputs

# v3.2.1/v4.2.1 - 2021-11-25

Fixed
  * [GITHUB-1](https://github.com/claranet/terraform-azurerm-regions/pull/1): Fix region Brazil typo (#1)

# v3.2.0/v4.2.0 - 2021-10-13

Changed
  * AZ-583: Allow standard name, CLI name or slug format as input
  * AZ-572: Revamp examples and improve CI

# v3.1.1/v4.1.1 - 2020-08-20

Updated
  * AZ-532: Revamp README with latest `terraform-docs` tool

# v3.1.0/v4.1.0 - 2021-01-08

Added
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
