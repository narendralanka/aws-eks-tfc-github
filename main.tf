terraform {
  required_version = ">= 1.5.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "narendra-devops-org"      # <<< change

    workspaces {
      name = "aws-eks-tfc-github"      # <<< change
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  name       = var.project_name
  cidr_block = var.vpc_cidr
}

module "eks" {
  source = "./modules/eks"

  cluster_name = "${var.project_name}-eks"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.public_subnet_ids  # <-- use public subnets for nodes
}




