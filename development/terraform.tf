terraform {
  backend "azurerm" {
    key              = "development.terraform.tfstate"
    use_azuread_auth = true
    use_oidc         = true
  }
}