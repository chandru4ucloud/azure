resource "azurerm_storage_account" "example" {
  name                     = "terraformmay2022"
  resource_group_name      = "1-fb8b25f6-playground-sandbox"
  location                 = "West US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_mssql_server" "example" {
  name                         = "terraformmay2022-sqlserver"
  resource_group_name      = "1-fb8b25f6-playground-sandbox"
  location                 = "West US"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "test" {
  name           = "acctest-db-d"
  server_id      = azurerm_mssql_server.example.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 1
   sku_name       = "S0"
 
#changes from github
  tags = {
    foo = "supercloud"
  }

}
