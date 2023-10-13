locals {
  location_slug = lookup(zipmap(values(local.regions), keys(local.regions)), var.azure_region, lookup(zipmap(values(local.cli_names), keys(local.cli_names)), var.azure_region, var.azure_region))

  # Azure region mapping between slug and standard format.

  regions = {
    us-west          = "West US"
    us-west-2        = "West US 2"
    us-west-3        = "West US 3"
    us-central       = "Central US"
    us-west-central  = "West Central US"
    us-south-central = "South Central US"
    us-north-central = "North Central US"
    us-east          = "East US"
    us-east-2        = "East US 2"
    can-central      = "Canada Central"
    can-east         = "Canada East"
    bra-south        = "Brazil South"
    bra-south-east   = "Brazil Southeast"
    uk-south         = "UK South"
    uk-west          = "UK West"
    eu-north         = "North Europe"
    eu-west          = "West Europe"
    fr-central       = "France Central"
    fr-south         = "France South"
    ger-north        = "Germany North"
    ger-north-east   = "Germany Northeast"
    ger-central      = "Germany Central"
    ger-west-central = "Germany West Central"
    swz-north        = "Switzerland North"
    swz-west         = "Switzerland West"
    norw-east        = "Norway East"
    norw-west        = "Norway West"
    saf-west         = "South Africa West"
    saf-north        = "South Africa North"
    ind-west         = "West India"
    ind-central      = "Central India"
    ind-south        = "South India"
    asia-south-east  = "Southeast Asia"
    asia-east        = "East Asia"
    cn-east          = "China East"
    cn-east-2        = "China East 2"
    cn-east-3        = "China East 3"
    cn-north         = "China North"
    cn-north-2       = "China North 2"
    cn-north-3       = "China North 3"
    kor-central      = "Korea Central"
    kor-south        = "Korea South"
    jap-east         = "Japan East"
    jap-west         = "Japan West"
    aus-central      = "Australia Central"
    aus-central-2    = "Australia Central 2"
    aus-east         = "Australia East"
    aus-south-east   = "Australia Southeast"
    uae-central      = "UAE Central" # United Arab Emirates
    uae-north        = "UAE North"   # United Arab Emirates

    # Global/continental zones
    "asia"    = "Asia"
    "asia-pa" = "Asia Pacific"
    "aus"     = "Australia"
    "bra"     = "Brazil"
    "can"     = "Canada"
    "eu"      = "Europe"
    "global"  = "Global"
    "ind"     = "India"
    "jap"     = "Japan"
    "uk"      = "United Kingdom"
    "us"      = "United States"
  }

  /* Short names based on the following rules (where possible) to have better clarity:
    - contains at least 3 chars, where 2 chars represent global part (continent)
    - use ISO 3166 code of country concatenation
  */
  short_names = {
    "us-east"          = "use"
    "us-east-2"        = "use2"
    "us-central"       = "usc"
    "us-north-central" = "usnc"
    "us-south-central" = "ussc"
    "us-west-central"  = "uswc"
    "us-west"          = "usw"
    "us-west-2"        = "usw2"
    "us-west-3"        = "usw3"
    "can-east"         = "cae"
    "can-central"      = "cac"
    "bra-south"        = "brs"
    "bra-south-east"   = "brse" # Brazil Southeast
    "eu-north"         = "eun"
    "eu-west"          = "euw"
    "fr-central"       = "frc"
    "fr-south"         = "frs"
    "uk-west"          = "ukw"
    "uk-south"         = "uks"
    "ger-central"      = "gce"
    "ger-north-east"   = "gne"
    "ger-north"        = "gno"
    "ger-west-central" = "gwc"
    "swz-north"        = "swn"
    "swz-west"         = "sww"
    "norw-east"        = "noe"
    "norw-west"        = "now"
    "asia-south-east"  = "asse"
    "asia-east"        = "asea"
    "aus-east"         = "aue"
    "aus-south-east"   = "ause"
    "aus-central"      = "auc"
    "aus-central-2"    = "auc2"
    "cn-east"          = "cne"
    "cn-north"         = "cnn"
    "cn-east-2"        = "cne2"
    "cn-north-2"       = "cnn2"
    "cn-east-3"        = "cne3"
    "cn-north-3"       = "cnn3"
    "ind-central"      = "inc"
    "ind-west"         = "inw"
    "ind-south"        = "ins"
    "jap-east"         = "jpe"
    "jap-west"         = "jpw"
    "kor-central"      = "krc"
    "kor-south"        = "krs"
    "saf-west"         = "saw"
    "saf-north"        = "san"
    "uae-central"      = "uaec"
    "uae-north"        = "uaen"

    # Global/continental zones
    "asia"    = "asia" # Asia
    "asia-pa" = "apac" # Asia Pacific
    "aus"     = "aus"  # Australia
    "bra"     = "bra"  # Brazil
    "can"     = "can"  # Canada
    "eu"      = "eu"   # Europe
    "global"  = "glob" # Global
    "ind"     = "ind"  # India
    "jap"     = "jap"  # Japan
    "uk"      = "uk"   # United Kingdom
    "us"      = "us"   # United States
  }

  # Thoses region CLI name where partially generated via
  # `az account list-locations --output json | jq -r '.[] | "\"\" = \"" + .name + "\" # " + .displayName'`
  cli_names = {
    "us-east"          = "eastus"             # East US
    "us-east-2"        = "eastus2"            # East US 2
    "us-south-central" = "southcentralus"     # South Central US
    "us-west-2"        = "westus2"            # West US 2
    "us-west-3"        = "westus3"            # West US 3
    "asia-south-east"  = "southeastasia"      # Southeast Asia
    "eu-north"         = "northeurope"        # North Europe
    "uk-south"         = "uksouth"            # UK South
    "eu-west"          = "westeurope"         # West Europe
    "us-central"       = "centralus"          # Central US
    "us-north-central" = "northcentralus"     # North Central US
    "us-west"          = "westus"             # West US
    "saf-north"        = "southafricanorth"   # South Africa North
    "ind-central"      = "centralindia"       # Central India
    "asia-east"        = "eastasia"           # East Asia
    "jap-east"         = "japaneast"          # Japan East
    "kor-central"      = "koreacentral"       # Korea Central
    "can-central"      = "canadacentral"      # Canada Central
    "fr-central"       = "francecentral"      # France Central
    "ger-west-central" = "germanywestcentral" # Germany West Central
    "norw-east"        = "norwayeast"         # Norway East
    "swz-north"        = "switzerlandnorth"   # Switzerland North
    "uae-north"        = "uaenorth"           # UAE North
    "bra-south"        = "brazilsouth"        # Brazil South
    "asia"             = "asia"               # Asia
    "asia-pa"          = "asiapacific"        # Asia Pacific
    "aus"              = "australia"          # Australia
    "bra"              = "brazil"             # Brazil
    "can"              = "canada"             # Canada
    "eu"               = "europe"             # Europe
    "global"           = "global"             # Global
    "ind"              = "india"              # India
    "jap"              = "japan"              # Japan
    "uk"               = "uk"                 # United Kingdom
    "us"               = "unitedstates"       # United States
    "us-west-central"  = "westcentralus"      # West Central US
    "saf-west"         = "southafricawest"    # South Africa West
    "aus-central"      = "australiacentral"   # Australia Central
    "aus-central-2"    = "australiacentral2"  # Australia Central 2
    "aus-east"         = "australiaeast"      # Australia East
    "aus-south-east"   = "australiasoutheast" # Australia Southeast
    "jap-west"         = "japanwest"          # Japan West
    "kor-south"        = "koreasouth"         # Korea South
    "ind-south"        = "southindia"         # South India
    "ind-west"         = "westindia"          # West India
    "can-east"         = "canadaeast"         # Canada East
    "fr-south"         = "francesouth"        # France South
    "ger-north"        = "germanynorth"       # Germany North
    "norw-west"        = "norwaywest"         # Norway West
    "swz-west"         = "switzerlandwest"    # Switzerland West
    "uk-west"          = "ukwest"             # UK West
    "uae-central"      = "uaecentral"         # UAE Central
    "bra-south-east"   = "brazilsoutheast"    # Brazil Southeast
    "ger-north-east"   = "germanynortheast"   # "Germany Northeast"
    "ger-central"      = "germanycentral"     # "Germany Central"

    "cn-north"   = "chinanorth"  # "China North"
    "cn-east"    = "chinaeast"   # "China East"
    "cn-east-2"  = "chinaeast2"  # "China East 2"
    "cn-north-2" = "chinanorth2" # "China North 2"
    "cn-east-3"  = "chinaeast3"  # "China East 3"
    "cn-north-3" = "chinanorth3" # "China North 3"
  }

  # Based on https://docs.microsoft.com/en-us/azure/availability-zones/cross-region-replication-azure
  # Can be retrieved by cli too:
  # `az account list-locations -o table --query '[].[displayName, name, metadata.pairedRegion[0].name]'`
  paired = {
    us-west          = "us-east"
    us-west-2        = "us-west-central"
    us-west-3        = "us-east"
    us-central       = "us-east-2"
    us-west-central  = "us-west-2"
    us-south-central = "us-north-central"
    us-north-central = "us-south-central"
    us-east          = "us-west"
    us-east-2        = "us-central"
    can-central      = "can-east"
    can-east         = "can-central"
    bra-south        = "us-south-central"
    bra-south-east   = "bra-south"
    uk-south         = "uk-west"
    uk-west          = "uk-south"
    eu-north         = "eu-west"
    eu-west          = "eu-north"
    fr-central       = "fr-south"
    fr-south         = "fr-central"
    ger-north        = "ger-west-central"
    ger-west-central = "ger-north"
    swz-north        = "swz-west"
    swz-west         = "swz-north"
    norw-east        = "norw-west"
    norw-west        = "norw-east"
    saf-west         = "saf-north"
    saf-north        = "saf-west"
    ind-west         = "ind-south"
    ind-central      = "ind-south"
    ind-south        = "ind-central"
    asia-south-east  = "asia-east"
    asia-east        = "asia-south-east"
    cn-east          = "cn-north"
    cn-east-2        = "cn-north-2"
    cn-east-3        = "cn-north-3"
    cn-north         = "cn-east"
    cn-north-2       = "cn-east-2"
    cn-north-3       = "cn-east-3"
    kor-central      = "kor-south"
    kor-south        = "kor-central"
    jap-east         = "jap-east"
    jap-west         = "jap-west"
    aus-central      = "aus-central-2"
    aus-central-2    = "aus-central"
    aus-east         = "aus-south-east"
    aus-south-east   = "aus-east"
    uae-central      = "uae-north"   # United Arab Emirates
    uae-north        = "uae-central" # United Arab Emirates
  }

  paired_region = try(local.paired[local.location_slug], null)
}
