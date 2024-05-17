environment        = "development"
location           = "eastus"
prefix             = "taco"
vnet_address_space = ["10.64.0.0/16"]
subnets = {
  web = "10.64.5.0/24"
  app = "10.64.6.0/24"
}