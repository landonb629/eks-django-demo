terraform { 
  required_providers {
    aws = {  
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }
  required_version = "1.6.0"
}

provider "aws" { 
  region = "us-east-2"
  profile = "empower"
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

