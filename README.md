# Terraform AWS EKS Module
This Terraform module deploys an Amazon EKS (Elastic Kubernetes Service) cluster on AWS using parameterized input variables.

# Usage
## Prerequisites
Before using this module, ensure you have the following prerequisites:

Terraform installed on your local machine (version >= 0.12). AWS account and IAM user with appropriate permissions. AWS CLI configured with access key and secret key.

## Step-by-Step Guide

1. Create a Directory

Create a new directory on your local machine where you want to set up this Terraform project.

```bash
mkdir terraform-eks
cd terraform-eks
touch main.tf variables.tf terraform.tfvars

Go to  https://github.com/lily4499/terraform-aws-eks-v4.git, copy main.tf, variables.tf and terraform.tfvars and in that directory.


```bash 

Initialize TerraformInitialize Terraform to download providers and modules:  
terraform init

Review Terraform PlanReview the Terraform execution plan to ensure the configuration is correct:  
terraform plan

Apply Terraform ConfigurationApply the Terraform configuration to create the EKS cluster:  
terraform apply --auto-approve

To Clean Up: 
terraform destroy --auto-approve