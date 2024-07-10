resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "lwarlkvnet"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = var.resource_group_name
  location            = var.location
  depends_on         = [azurerm_resource_group.main]

}

resource "azurerm_subnet" "vnetsubnet" {
  name                 = "lwarkvnetsub"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
}

resource "azurerm_storage_account" "main_storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = "true"

  network_rules {

    default_action             = "Allow"
    virtual_network_subnet_ids = ["${azurerm_subnet.vnetsubnet.id}"]
    bypass                     = ["AzureServices"]
  }
}
resource "azurerm_storage_data_lake_gen2_filesystem" "datalakestorage" {
  name               = "datalake_test"
  storage_account_id = azurerm_storage_account.main_storage.id
  depends_on         = [azurerm_storage_account.main_storage]
}