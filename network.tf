module "network"{

    source="./network"
    vpc_cidr=var.vpc_cidr
    region   = var.region
    subnets  = var.subnets
}