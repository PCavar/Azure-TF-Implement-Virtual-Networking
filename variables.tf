variable "azure_region" {
  type        = list(string)
  description = "Accepted values for regions"
  default     = ["Sweden Central", "North Europe", "West Europe", "West US", "East US", "Central US"]
}

variable "azure_resource_group_name" {
  type        = string
  description = "Name of the resource group to be provisioned"
  default     = "az104-04-rg1"
}

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

##CREDENTIALS STORED LIKE THIS IS NOT CONSIDERED
##SAFE OR BEST PRACTICE.
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
      admin_name               = "studentazure"
      admin_pass               = "Sommar202020!"
      size_sku                 = "Standard_D1_v2"
      storage_account_type_ref = "Standard_LRS"
    },
    vm1 = {
      name                     = "az104-04-vm1"
      nic_name                 = "az104-04-nic1"
      public_ip_name           = "az104-04-pip1"
      subnet_id                = "subnet1"
      admin_name               = "studentazure"
      admin_pass               = "Sommar202020!"
      size_sku                 = "Standard_D1_v2"
      storage_account_type_ref = "Standard_LRS"
    }
  }
}

variable "azure_network_security_group" {
  type        = string
  description = "Name of the NSG provisioned"
  default     = "az104-04-nsg01"
}