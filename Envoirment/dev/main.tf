module "RG" {
  source   = "github.com/rajeev24yadav/terraform_module/Module/1RG"
  RG_group = var.RG_group1
}
module "Vnet_subnet" {
  depends_on = [module.RG]

  source  = "github.com/rajeev24yadav/terraform_module/Module/2VnetSubnet"
  meest   = var.meest1
  subnets = var.subnets1
}
module "publicip" {
  source     = "github.com/rajeev24yadav/terraform_module/Module/3PIP"
  public     = var.public1
  depends_on = [module.RG]

}
module "nic_card" {
  source     = "github.com/rajeev24yadav/terraform_module/Module/4Nic"
  meest_nic  = var.meest_nic1
  depends_on = [module.Vnet_subnet, module.publicip]
}
module "Rule" {
  source     = "github.com/rajeev24yadav/terraform_module/Module/5NSGAssociation"
  nsg_rule   = var.nsg_rule
  rule       = var.rule1
  depends_on = [module.nic_card, module.Vnet_subnet]

}
module "NSG_Association" {
  source          = "github.com/rajeev24yadav/terraform_module/Module/nsg_association"
  nsg_association = var.nsg_Association
  depends_on      = [module.Rule]

}
module "virtual_machine" {
  source     = "github.com/rajeev24yadav/terraform_module/Module/6VM"
  VM         = var.VM1
  depends_on = [module.Rule]

}