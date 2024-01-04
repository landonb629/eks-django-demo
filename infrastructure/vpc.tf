module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"

  azs = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  public_subnets = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]

  enable_dns_hostnames = true
  enable_dhcp_options = true 
  enable_nat_gateway = true

  tags = { 
    Environment = "dev"
  }
}

output "vpc_id" { 
  description = "ID of VPC"
  value = module.vpc.vpc_id
}