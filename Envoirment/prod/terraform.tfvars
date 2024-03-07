RG_group1 = {
  rg1 = {
    name     = "prod_RG"
    location = "Central India"
  }
}
meest1 = {
  V1 = {
    name          = "dev_Vnet"
    address_space = ["192.168.0.0/16"]
    location      = "Central India"
    rg            = "prod_RG"

} }
subnets1 = {
  sub1 = {
    name                 = "sub1"
    rg                   = "prod_RG"
    virtual_network_name = "dev_Vnet"
    address_prefixes     = ["192.168.0.0/24"]
  }
}
public1 = {
  pip1 = {
    name     = "dev_pip1"
    rg       = "prod_RG"
    location = "Central India"
  }
}
meest_nic1 = {
  nic = {
    name                 = "dev_nic1"
    location             = "Central India"
    rg                   = "prod_RG"
    subnet_name          = "sub1"
    virtual_network_name = "dev_Vnet"
    publicip             = "dev_pip1"

  }
}
nsg_rule = {
  nsg1 = {
    name                 = "dev_nsg"
    rg                   = "prod_RG"
    location             = "Central India"
    subnet_name          = "sub1"
    virtual_network_name = "dev_Vnet"

} }
rule1 = {
  rule = {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  rule4 = {
    name                       = "http"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
nsg_Association = {
  nsg_rule1 = {
    rg                   = "prod_RG"
    subnet_name          = "sub1"
    virtual_network_name = "dev_Vnet"
    nsg                  = "dev_nsg"
  }
}

VM1 = {
  vms = {
    name           = "sub1"
    rg             = "prod_RG"
    location       = "Central India"
    size           = "Standard_F2"
    admin_username = "Amit"
    admin_password = "Password@123"
    nicname        = "dev_nic1"
  }
}
