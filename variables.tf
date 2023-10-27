## Choose a region where to provision resources. Or change to what suits you in "default"
variable "azure_region" {
  type        = list(string)
  description = "Accepted values for regions"
  default     = ["Sweden Central", "North Europe", "West Europe", "West US", "East US", "Central US"]
}

## Name of the resource group provisioned for this project
variable "azure_resource_group_name" {
  type        = string
  description = "Name of the resource group to be provisioned"
  default     = "az104-04-rg1"
}

## Name and CIRD block of the provisioned VNET
variable "azure_virtual_network" {
  type = map(object({
    name = string
    cidr = string
  }))
  default = {
    vnet1 = {
      name = "az104-04-vnet1"
      cidr = "10.40.0.0/20"
    }
  }
}

## Name and value of the two provisioned subnets
variable "azure_subnets" {
  type = map(object({
    name = string
    cidr = string
  }))
  default = {
    subnet0 = {
      name = "Subnet0"
      cidr = "10.40.0.0/24"
    },
    subnet1 = {
      name = "Subnet1"
      cidr = "10.40.1.0/24"
    }
  }
}

## CREDENTIALS/SENSITIVE INFORMATION STORED HERE IS NOT CONSIDERED
## SAFE OR BEST PRACTICE.
## Required parameters to deploy a virtual machine
variable "azure_virtual_machines" {
  type = map(object({
    name                     = string
    nic_name                 = string
    public_ip_name           = string
    subnet_id                = string
    admin_name               = string
    admin_pass               = string
    size_sku                 = string
    storage_account_type_ref = string
  }))
  default = {
    vm0 = {
      name                     = "az104-04-vm0"
      nic_name                 = "az104-04-nic0"
      public_ip_name           = "az104-04-pip0"
      subnet_id                = "subnet0"
      // You will be promted to enter credentials when running terraform apply
      admin_name               = null
      admin_pass               = null
      size_sku                 = "Standard_D1_v2"
      storage_account_type_ref = "Standard_LRS"
    },
    vm1 = {
      name                     = "az104-04-vm1"
      nic_name                 = "az104-04-nic1"
      public_ip_name           = "az104-04-pip1"
      subnet_id                = "subnet1"
      // You will be promted to enter credentials when running terraform apply
      admin_name               = null
      admin_pass               = null
      size_sku                 = "Standard_D1_v2"
      storage_account_type_ref = "Standard_LRS"
    }
  }
}

## Name of the Network Security Group
variable "azure_network_security_group" {
  type        = string
  description = "Name of the NSG provisioned"
  default     = "az104-04-nsg01"
}

## Name of your domain
variable "dns_name_zone_private" {
  type        = string
  description = "Name of the Private DNS Provisioned"
  default     = "contoso.org"
}

## Link required to autoregister virtual machines
variable "dns_name_zone_link" {
  type        = string
  description = "Name of the DNS Zone Virtual Link"
  default     = "DNS_Zone_Link"
}