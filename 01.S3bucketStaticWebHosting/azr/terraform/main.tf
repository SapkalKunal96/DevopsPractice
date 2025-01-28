resource "random_string" "random-string" {
  length  = 5
  special = false
  upper   = false

}




# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "East US"
}



resource "azurerm_storage_account" "storage-account" {
  name                     = "cloudenthousiaststorage-${random_string.random-string.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

resource "azurerm_storage_account_static_website" "static-website" {
  storage_account_id = azurerm_storage_account.storage-account.id
  # error_404_document = ""
  index_document = "index.html"
}