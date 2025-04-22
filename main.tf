terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "core"
}

locals {
  subnets = cidrsubnets("10.0.0.0/24", 8, 7)
}

# data "azurerm_client_config" "current" {}

# import {
#   to = azurerm_resource_group.temp_resource_group_1
#   id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}$/resourceGroups/temp_rg1"
# }

# resource "azurerm_resource_group" "contoso_rg" {
#   name     = "${var.prefix}_rg"
#   location = var.region
#   tags     = var.tags
# }

# resource "azurerm_resource_group" "contoso_dev_rg" {
#   name     = "${var.prefix}_dev_rg"
#   location = var.region
#   tags     = var.tags
# }

resource "azurerm_resource_group" "demo" {
  for_each = var.resource_groups
  name     = "${var.prefix}_${each.value}"
  location = var.region
  tags     = var.tags
}

# resource "azurerm_resource_group" "temp_resource_group_1" {
#   name     = "temp_rg1"
#   location = "UK South"

#   tags = {
#     reference = data.azurerm_resource_group.temp_resource_group_2.id
#   }
# }

# data "azurerm_resource_group" "temp_resource_group_2" {
#   name = "temp_rg2"
# }