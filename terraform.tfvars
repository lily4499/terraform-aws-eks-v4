region         = "us-east-1"   //provide your Region here

# AWS credentials
#aws_access_key = "your-access-key"
#aws_secret_key = "your-secret-key"


# VPC configuration
vpc_cidr       = "10.0.0.0/16"
dns_hostnames  = true
dns_support    = true
pub_one_cidr   = "10.0.1.0/24"
pub_two_cidr   = "10.0.2.0/24"
priv_one_cidr  = "10.0.3.0/24"
priv_two_cidr  = "10.0.4.0/24"

# EKS cluster configuration
cluster_name   = "liliekscluster"  //provide your Cluster Name here
eks_version    = "1.26"
ami_type       = "AL2_x86_64"
instance_types = ["t3.small", "t3.medium", "t3.large"]
capacity_type  = "ON_DEMAND"

