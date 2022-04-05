output "location" {
  value       = local.regions[local.location_slug]
  description = "Azure region in standard format"
}

output "location_short" {
  value       = local.short_names[local.location_slug]
  description = "Azure region in short format for resource naming purpose"
}

output "location_cli" {
  value       = local.cli_names[local.location_slug]
  description = "Azure region in Azure CLI name format"
}

output "location_slug" {
  value       = local.location_slug
  description = "Azure region in slug format"
}

output "paired_location" {
  description = <<EOD
Azure paired region with the current one. All formats available as attributes.
```
object({
  location (string): Azure paired region in standard format
  location_short (string): Azure paired region in short format for resource naming purpose
  location_cli (string): Azure paired region in CLI name format
  location_slug (string): Azure paired region in slug format
})
```
EOD
  value = local.paired_region == null ? null : {
    location       = local.regions[local.paired_region]
    location_short = local.short_names[local.paired_region]
    location_cli   = local.cli_names[local.paired_region]
    location_slug  = local.paired_region
  }
}
