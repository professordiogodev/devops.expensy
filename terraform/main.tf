provider "azurerm" {
  features {}
}

# Your resource group (already imported)
resource "azurerm_resource_group" "rg" {
  name     = "taco-rg"
  location = "germanywestcentral"
}

# Reference the shared Ironhack AKS cluster (read-only, no creation)
data "azurerm_kubernetes_cluster" "aks" {
  name                = "dv-ft-main-cluster"
  resource_group_name = "diogos-_group"
}

# Output the cluster details for reference
output "cluster_name" {
  value = data.azurerm_kubernetes_cluster.aks.name
}

output "cluster_location" {
  value = data.azurerm_kubernetes_cluster.aks.location
}

output "kube_config" {
  value     = data.azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "cluster_fqdn" {
  value = data.azurerm_kubernetes_cluster.aks.fqdn
}
