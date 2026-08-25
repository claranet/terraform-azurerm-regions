# AI Agents Guidelines for OpenTofu Module Development

This document provides shared guidelines for AI agents working on OpenTofu modules to ensure consistency, clarity, and alignment with best practices.

## Overview

When working on OpenTofu modules, AI agents should optimize modules, outputs, variables, and file structures according to the specifications outlined in this document. The goal is to maintain consistency across all OpenTofu configurations while following established best practices.

## Key Principles

1. **Consistency**: Maintain uniform naming conventions and structures across all modules
2. **Clarity**: Ensure code is readable and well-documented
3. **Best Practices**: Follow OpenTofu and Terraform community standards
4. **Retrocompatibility**: Preserve backward compatibility when making changes

## Shared Implementation Guidelines

### 1. Output Management

Replace module and resource output names consistently:
- Use `id` instead of `app_service_id`
- Use `name` instead of `app_service_name`

Add a global resource output for the main resource in every module:
```terraform
output "resource" {
  value = [RESOURCE_TYPE].main
}
```

Ensure outputs are added for all resources and modules referred within each module:
```terraform
output "module_service_plan" {
  value = module.service_plan
}
output "resource_application_insights" {
  value = azurerm_application_insights.main
}
```

### 2. Resource Naming

Rename the main resource of each module to "main" for consistent reference:
```terraform
resource "azurerm_service_plan" "main" {}
```

Add the `moved` block for retrocompatibility:
```terraform
moved {
  from = azurerm_service_plan.old_resource_name
  to   = azurerm_service_plan.main
}
```

### 3. Variable Standards

- Update variable descriptions to include clear punctuation (add dots at the end of sentences)
- Use Markdown links consistently within descriptions `[text](http://example_url)`
- Update variable naming for clarity and consistency (e.g., change `custom_diagnostic_settings_name` to `diagnostic_settings_custom_name`)
- Ensure `lookup()` includes a default value:
  ```terraform
  lookup("parameter_name", var.parameter, "default_value")
  ```
- Avoid using `lookup` for typed variables

### 4. File Organization Standards

Use standardized naming conventions for files:
- Data sources: [`d-naming.tf`](d-naming.tf) for specific naming datasources and `data-sources.tf` for grouped datasources
- Resources: For example, `r-app-service.tf` for specific resources like `azurerm_app_service`
- Module calls: [`m-logs.tf`](m-logs.tf) for example for logs diagnostic settings module, `m-` prefix for others module calls
- Split providers constrains into a dedicated [`providers.tf`](providers.tf) file
- Split inputs in `variables-xx.tf` files and outputs in `outputs-xx.tf` files, where `xx` is a specific category (e.g., `variables-logs.tf`, `outputs-resources.tf`)

### 5. Documentation Requirements

- Add a table for OpenTofu versions, including version 8.x.x
- Include a warning about modules not being verified for Terraform versions >= 1.3
- Add notes to indicate optimization for OpenTofu versions >= 1.8
- Light rework of examples:
  - Provide examples in [`base.tf`](examples/main/base.tf) (used for initialization/validation/plan) but exclude detailed examples from README
- Align README content with updated module names, outputs, and conventions
- Use the `terraform-docs` tool for generating documentation and ensure it is up-to-date with the latest module structure and outputs

### 6. Control Flow Best Practices

Ensure IDs in keys are avoided; use fixed strings or clearly defined keys.

Use `count` for conditional/boolean operations:
```terraform
resource "my_resource" {
  count = var.resource_enabled ? 1 : 0
  ...
}
```

Avoid the use of generated values (like resource's id) in `count` or `for_each`. Replace with an object-wrapping approach:
```terraform
variable "resource" { type = object({ id = string }) }
resource "my_other_resource" {
  count = var.resource == null ? 1 : 0
  attr_id = var.resource.id
}
```

### 7. Version Management

- Enforce Terraform version constraints >= 1.3 in [`versions.tf`](versions.tf)
- Require OpenTofu >= 1.12 in CI/CD configurations
- Update both `.gitlab-ci.yml` and `providers.tf` to reflect AzureRM provider version constraints

### 8. Miscellaneous Updates

- Fork and use Claranet's "azurecaf naming" provider for naming conventions
- Avoid "unknown values" comparison issues using non-null wrappers for input-generated values

**Do not use:**
```terraform
variable "resource_id" {}
resource "my_other_resource" {
  count = var.resource_id == null ? 1 : 0
  ...
}
```

**Instead, wrap into objects:**
```terraform
variable "resource" { type = object({ id = string }) }
resource "my_other_resource" {
  count = var.resource == null ? 1 : 0
  attr_id = var.resource.id
}
```

## Example Transformation

**Before (Input):**
```terraform
output "app_service_id" {
  value = azurerm_app_service.main.id
}

output "app_service_name" {
  value = azurerm_app_service.main.name
}
```

**After (Transformed Output):**
```terraform
output "id" {
  value = azurerm_app_service.main.id
}

output "name" {
  value = azurerm_app_service.main.name
}

output "resource" {
  value = azurerm_app_service.main
}

output "module_service_plan" {
  value = module.service_plan
}

output "resource_application_insights" {
  value = azurerm_application_insights.main
}
```

## Module Upgrade to v9

This file is designed to be read by OpenCode directly. From the OpenCode prompt, tell the agent:

> Using @../../ci/{{cookiecutter.module_name}}/AGENTS.md guidelines, upgrade this module to v9

When upgrading a module to v9, apply the following changes in addition to the guidelines above:

### 0. Development Branch

- Create/use `v9/SREAA-368` as the git development branch for all v9 upgrade work, per the [Git Contribution Guidelines](#git-contribution-guidelines).

### 1. OpenTofu Version

- Set the OpenTofu version constraint to `>= 1.12` in [`versions.tofu`](versions.tofu):
  ```terraform
  terraform {
    required_version = ">= 1.12"
  }
  ```
- Update the `opentofu` entry to `1.12.5` (or the latest patch satisfying `>= 1.12`) in the mise tool pins, [`.tool-versions`](.tool-versions), then regenerate `mise.lock` (if present in the module) with `mise lock` so both files agree. `mise.lock` is generated, do not hand-edit it.

### 2. Provider Versions

- Set the AzureRM provider version constraint to `~> 5.0` and, when the module uses Claranet's
  "azurecaf naming" provider, set its constraint to `~> 1.3.0` in [`providers.tf`](providers.tf):
  ```terraform
  terraform {
    required_providers {
      azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 5.0"
      }
      azurecaf = {
        source  = "claranet/azurecaf"
        version = "~> 1.3.0"
      }
    }
  }
  ```
- These are the constraints carried by `providers.tf` in the v9 module template of the `../../ci` repository,
  which is the reference for the target state. Modules migrated early may still carry a looser constraint such
  as `>= 1.2.28` for `azurecaf`; do not copy that, bump them to `~> 1.3.0`.

### 3. Diagnostic Settings Module

- Bump the Claranet `diagnostic-settings` module used for logs (usually in [`m-logs.tf`](m-logs.tf), sometimes
  named `r-logs.tf`) to `~> 9.0`, which is the v9-compatible release (AzureRM `~> 5.0`):
  ```terraform
  module "diagnostics" {
    source  = "claranet/diagnostic-settings/azurerm"
    version = "~> 9.0"
    ...
  }
  ```
- Modules still pinned to `~> 8.0` (or with the `version` line commented out) must be updated: the `8.x` releases
  require AzureRM `~> 4.31`, which conflicts with the root module's `~> 5.0` constraint and breaks provider resolution.
- Apply the same bump to any other Claranet submodule call in the module and its `examples/`, but pin those with
  the three-part form `~> 9.0.0` instead of `~> 9.0`: it only allows patch releases (`9.0.x`), so bugfixes are
  picked up automatically while a new minor release stays an explicit, reviewed bump. `diagnostic-settings` is the
  exception, `~> 9.0` is fine there.

### 4. Examples Directory

- Update every `examples/*/versions.tf` (and any other version-pinning file under `examples/`) to match the same `required_version` (OpenTofu `>= 1.12`) and AzureRM provider (`~> 5.0`) constraints applied to the module root in steps 1 and 2.
- Check all examples for breaking changes too, not just the root module.

### 5. GitLab CI Template

- The v9 pipeline changes are merged and released in the `../../ci` repository (release `9.0.0`), so the
  `.gitlab-ci.yml` include `ref` must stay on `master`:
  ```yaml
  include:
    - project: "claranet/projects/cloud/azure/terraform/ci"
      ref: master
      file: "/pipeline.yml"
  ```
- Only point the `ref` at a temporary branch such as `v9/SREAA-368` while the pipeline changes you depend on
  are still unreleased in the `ci` repository, and revert it to `master` (or the relevant release tag) before merging.
- Modules migrated before the `ci` `9.0.0` release may still point at `ref: v9/SREAA-368`; revert those to `master`.
- Also update the `.gitlab-ci.yml` `variables` block so `TF_MIN_VERSION` and `AZURERM_PROVIDER_MIN_VERSION` match the new constraints from steps 1 and 2:
  ```yaml
  variables:
    TF_MIN_VERSION: "1.12"
    AZURERM_PROVIDER_MIN_VERSION: "5.0"
  ```

### 6. `.config` Directory Sync

- Sync [`.config/terraform-docs.yml`](.config/terraform-docs.yml) and [`.config/tflint.hcl`](.config/tflint.hcl) with the versions found in the `../../ci` repository root `.config/` directory, so the module stays aligned with the latest linting and documentation rules.

### 7. AzureRM 5.0 Code Migration

- Before touching resource/data-source code, read the official upgrade guide: [AzureRM Provider 5.0 Upgrade Guide](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/5.0-upgrade-guide).
  The registry renders that page client-side, so agents fetching it programmatically get an empty document. Use the
  source Markdown instead:
  ```bash
  curl -sSL https://raw.githubusercontent.com/hashicorp/terraform-provider-azurerm/main/website/docs/guides/5.0-upgrade-guide.html.markdown
  ```
- Cross-check the guide against the provider schema after `tofu init -upgrade`, since the schema is authoritative
  for whether an argument the module uses still exists: `tofu providers schema -json`.
- Identify and apply every breaking change relevant to the resources used in the module (renamed/removed arguments, changed defaults, removed resources/data sources, behavior changes, etc.) as documented in the guide.
- Re-run `tflint` and `tofu validate`/`plan` after migration to confirm the module is compatible with AzureRM `~> 5.0`.

### 8. Regenerate README.md

- After the `.config` sync (step 6), regenerate `README.md` with `terraform-docs` using the updated [`.config/terraform-docs.yml`](.config/terraform-docs.yml) template, via the `tofu_docs` hook (`prek`/`pre-commit`):
  ```bash
  prek run tofu_docs --all-files
  # or: pre-commit run tofu_docs --all-files
  ```
- Review the diff to ensure inputs/outputs/versions reflect the v9 changes (new variables, outputs, version constraints).

### 9. Commit and Open MR

- Commit all v9 upgrade changes using [Conventional Commits](https://www.conventionalcommits.org/) with the following structure:
  ```
  feat(SREAA-368): upgrade module to v9 (OpenTofu >= 1.12, AzureRM ~> 5.0)

  {description body}

  BREAKING CHANGES: {breaking description}
  ```
  - `{description body}`: summarize the changes applied (version bumps, diagnostic settings module bump, examples updated, AzureRM 5.0 migration, README regeneration, etc.).
  - `BREAKING CHANGES: {breaking description}`: list every breaking change from the AzureRM 5.0 migration (step 7) and the raised minimum versions, so consumers know what to expect when upgrading.
- Push the development branch, then open a merge request from `v9/SREAA-368` against `master` or `main`
  (default branch) using the [`glab`](https://gitlab.com/gitlab-org/cli) CLI. `--source-branch` is the branch
  holding the work and `--target-branch` is the branch it is merged into, so the target is the default branch,
  never `v9/SREAA-368`:
  ```bash
  git push -u origin v9/SREAA-368

  glab mr create \
    --source-branch v9/SREAA-368 \
    --target-branch master \
    --title "feat(SREAA-368): upgrade module to v9 (OpenTofu >= 1.12, AzureRM ~> 5.0)" \
    --description "@ldap-sync/FR-Git-Factory-FAC-SJSVSK {description body}"
  ```
  `--source-branch` defaults to the current branch and can be omitted when running the command from
  `v9/SREAA-368`. Use `--target-branch main` on modules whose default branch is `main`.
- Ensure all pre-commit checks and CI pipelines pass before requesting review.

## Git Contribution Guidelines

All AI agents must follow these git contribution standards when working on OpenTofu modules:

### Branch Management
- **Create a new branch** for each contribution
- **Use prefixed branch names** based on the type of change:
  - `feat/add_new_param` - for new features or parameters
  - `fix/change_attribute` - for bug fixes or corrections
  - `docs/update_readme` - for documentation updates
  - `refactor/rename_variables` - for code refactoring
  - `chore/update_dependencies` - for maintenance tasks

### Commit Standards
- **Follow conventional commits structure**: `type(scope): description`
- **Optional unicode emojis** are allowed for better readability
- **Examples**:
  - `feat(outputs): ✨ add global resource output`
  - `fix(variables): 🐛 correct lookup default value`
  - `docs(readme): 📝 update version compatibility table`
  - `refactor(resources): ♻️ rename main resource with moved block`

### Development Environment
- **Install and update tools** using mise-en-place: `mise install`
- **Keep tools up-to-date** before starting work
- **Verify tool versions** match project requirements in [`.tool-versions`](.tool-versions)

### Code Quality Assurance
- **Install the git hooks**: `prek install` (or `pre-commit install`). `prek` is the runner pinned in
  [`.tool-versions`](.tool-versions), and [`.pre-commit-config.yaml`](.pre-commit-config.yaml) declares
  `default_install_hook_types: [commit-msg, pre-commit]`, so both hook types are installed in one command.
- **The hooks must trigger** on each commit to ensure validity of changes
- **All pre-commit checks must pass** before pushing changes
- **Address any pre-commit failures** immediately

### Review Process
- **Open a merge request** when changes are ready for review
- **Provide clear description** of changes and their impact
- **Reference related issues** or requirements
- **Ensure all CI/CD checks pass** before requesting review
- **Address review feedback** promptly and thoroughly

## AI Agent Responsibilities

When working on OpenTofu modules, AI agents should:

1. **Analyze** existing code structure and identify areas for improvement
2. **Apply** the standardized naming conventions and file structures
3. **Update** outputs, variables, and documentation according to guidelines
4. **Validate** configurations against best practices
5. **Ensure** retrocompatibility through appropriate migration strategies
6. **Follow** git contribution guidelines for all changes
7. **Document** changes and maintain clear commit messages

## Quality Assurance

- Validate all examples and configurations against updated specifications
- Ensure consistency across all documentation files
- Test variable naming conventions and OpenTofu configurations
- Verify that all changes maintain backward compatibility
- Confirm all pre-commit checks pass
- Ensure proper git workflow is followed

## Notes for AI Agents

- Focus on alignment with best practices for readability
- Avoid introducing unnecessary complexity
- Carefully validate examples against specifications
- Maintain consistency across all files and configurations
- Always include retrocompatibility measures when making breaking changes
- Follow git contribution guidelines for proper version control
