// Configure Terraform providers
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

// Define AWS provider configuration
provider "aws" {
  region = var.region  // Use the region specified in variables
}

// Include modules for specific configurations

#The vpc module handles the VPC creation and subnet definitions.

module "vpc" {
  source = "./my_vpc"

  vpc_id          = module.vpc.vpc_id  # Reference the VPC ID created by the VPC module
  #vpc_id         = module.my_vpc.vpc_id   # Use the vpc_id output from my_vpc module
  vpc_cidr       = var.vpc_cidr
  dns_hostnames  = var.dns_hostnames
  dns_support    = var.dns_support
  pub_one_cidr   = var.pub_one_cidr
  pub_two_cidr   = var.pub_two_cidr
  priv_one_cidr  = var.priv_one_cidr
  priv_two_cidr  = var.priv_two_cidr
} 

#The eks module leverages the outputs (private_subnet_ids, public_subnet_ids) from the my_vpc module for configuring the Amazon EKS cluster, without needing to redefine the VPC-related variables.

module "eks" {
  source = "./my_eks"

  # Provide required input variables for EKS module

  vpc_id         = module.vpc.vpc_id 
  vpc_cidr       = var.vpc_cidr
  dns_hostnames  = var.dns_hostnames
  dns_support    = var.dns_support
  pub_one_cidr   = var.pub_one_cidr
  pub_two_cidr   = var.pub_two_cidr
  priv_one_cidr  = var.priv_one_cidr
  priv_two_cidr  = var.priv_two_cidr

  cluster_name                = var.cluster_name
  eks_version                 = var.eks_version
  ami_type                    = var.ami_type
  instance_types              = var.instance_types
  capacity_type               = var.capacity_type

    # Pass VPC-related information from my_vpc module to my_eks module
  private_subnet_ids          = module.vpc.private_subnet_ids
  public_subnet_ids           = module.vpc.public_subnet_ids
 
}



