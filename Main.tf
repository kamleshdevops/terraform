
provider "azurerm" {
  features {}
}

module "rg" {
  source   = "./modules/rg"
  name     = "rg-assignment"
  location = "East US"
}

module "vnet" {
  source   = "./modules/vnet"
  name     = "vnet-assignment"
  location = module.rg.location
  rg_name  = module.rg.name
}

module "subnet" {
  source     = "./modules/subnet"
  name       = "subnet-assignment"
  vnet_name  = module.vnet.name
  rg_name    = module.rg.name
}

module "public_ip" {
  source   = "./modules/public_ip"
  name     = "pip-assignment"
  location = module.rg.location
  rg_name  = module.rg.name
}

module "nic" {
  source        = "./modules/nic"
  name          = "nic-assignment"
  location      = module.rg.location
  rg_name       = module.rg.name
  subnet_id     = module.subnet.id
  public_ip_id  = module.public_ip.id
}

module "vm" {
  source   = "./modules/vm"
  name     = "vm-assignment"
  location = module.rg.location
  rg_name  = module.rg.name
  nic_id   = module.nic.id
}
