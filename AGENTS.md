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
- Require OpenTofu >= 1.8 in CI/CD configurations
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
- **Install pre-commit hooks**: `pre-commit install`
- **Pre-commit must trigger** on each commit to ensure validity of changes
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
