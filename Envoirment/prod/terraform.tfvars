RG_group1 = {
  rg1 = {
    name     = "prod_rg1"
    location = "centralindia"
  }
}
meest1 = {
  V1 = {
    name          = "prod_Vnet"
    address_space = ["10.0.0.0/16"]
    location      = "centralindia"
    rg            = "prod_rg1"

} }
subnets1 = {
  sub1 = {
    name                 = "prod_sub1"
    rg                   = "prod_rg1"
    virtual_network_name = "prod_Vnet"
    address_prefixes     = ["10.0.0.0/24"]
  }
}
public1 = {
  pip1 = {
    name     = "prod_pip1"
    rg       = "prod_rg1"
    location = "centralindia"
  }
}
meest_nic1 = {
  nic = {
    name                 = "prod_nic1"
    location             = "centralindia"
    rg                   = "prod_rg1"
    subnet_name          = "prod_sub1"
    virtual_network_name = "prod_Vnet"
    publicip             = "prod_pip1"

  }
}
nsg_rule = {
  nsg1 = {
    name                 = "prod_nsg"
    rg                   = "prod_rg1"
    location             = "centralindia"
    subnet_name          = "prod_sub1"
    virtual_network_name = "prod_Vnet"

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
    rg                   = "prod_rg1"
    subnet_name          = "prod_sub1"
    virtual_network_name = "prod_Vnet"
    nsg                  = "prod_nsg"
  }
}

VM1 = {
  vms = {
    name           = "prod_test"
    rg             = "prod_rg1"
    location       = "centralindia"
    size           = "Standard_F2"
    admin_username = "Amit"
    admin_password = "Password@123"
    nicname        = "prod_nic1"
  }
}
