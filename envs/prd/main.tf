provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source      = "../../modules/vpc"
  environment = "prd"
  cidr_block  = "10.0.0.0/16"
}

module "ecr" {
  source      = "../../modules/ecr"
  environment = "prd"
  app_name    = "app"
}

module "ecs" {
  source         = "../../modules/ecs"
  environment    = "prd"
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.private_subnet_ids
  repository_url = module.ecr.repository_url
}