########## Deploying VPC##################
module "vpc" {
#  source          = "../../../modules/network/vpc"
  source          = "../../modules/network/vpc"
  vpc_name        = var.vpc_name
  internetgw_name = var.internetgw_name
  vpc-cidr-block  = var.vpc-cidr-block
  extra_tags      = var.extra_tags
}

############ Deploying Public Subnet ################
module "subnet_public" {
  depends_on = [module.vpc]
  source          = "../../modules/network/subnet"
  for_each = var.public-subnet

  public_subnet = true
  vpc_id        = module.vpc.vpc_id
  internetgw_id = module.vpc.internet_gw_id

  name               = each.value["name"]
  cidr_block         = each.value["cidr"]
  availability_zones = each.value["az"]

  extra_tags = var.extra_tags
}

######## Deploying natgw subnet ####################

module "natgw" {
  depends_on = [module.subnet_public]
  source     = "../../modules/network/nat_gw"
  for_each = var.name_and_cidr_for_natgw
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.subnet_public[each.value.pub].subnet_id
  natgw_name = each.value.name
  extra_tags = var.extra_tags
}

############ Deploying private subnet ###############
module "subnets_private" {
  depends_on = [module.natgw]
  source = "../../modules/network/subnet"
  for_each = var.private-subnet
  vpc_id = module.vpc.vpc_id
  natgw_id = module.natgw[each.value.gw].natgw_id
  name               = each.value.name
  cidr_block         = each.value.cidr
  availability_zones = each.value.az

  extra_tags = var.extra_tags
}

########### Deploying Secret Manager #############
#module "secret-manager" {
#  source          = "../../modules/secret-manager"
#  for_each = var.secret
#  secret_name     = each.value.name
#  username        = each.value.username
#  extra_tags      = var.extra_tags
#}
