provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "taco-rg"
  location = "germanywestcentral"
}

# Azure Kubernetes Service (AKS) Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "taco-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "tacoaks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s" # Free-tier friendly
  }

  identity {
    type = "SystemAssigned"
  }
}

