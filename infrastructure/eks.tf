module "eks" { 
  source = "terraform-aws-modules/eks/aws"

  cluster_name = "demo-cluster"
  cluster_version = "1.27"
  
  cluster_endpoint_public_access = true 
  cluster_addons = { 
    vpc-cni = { 
      most_recent = true 
      before_compute = true 
    }
  }

  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets
  control_plane_subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = { 
    instance_types = ["t3.medium", "t3.large"]
  }

  eks_managed_node_groups = {
    group1 =  { 
      min_size = 1 
      max_size = 2
      desired_size = 2
      instance_types = ["t2.medium"]
      capacity_type = "SPOT"
    }
  }

  manage_aws_auth_configmap = true 
}