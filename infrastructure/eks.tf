module "eks" { 
  source = "terraform-aws-modules/eks/aws"

  cluster_name = "demo-cluster"
  cluster_version = "1.27"
  
  cluster_endpoint_public_access = true 
  cluster_addons = { 
    vpc-cni = { 
      most_recent = true 
      before_compute = true 
    },
    aws-ebs-csi-driver =  { 
      service_account_role_arn = data.aws_iam_role.ebs-role.arn
      resolve_conflicts = "PRESERVE"
    }
  }

  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets
  control_plane_subnet_ids = module.vpc.public_subnets

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

resource "aws_iam_role" "ebs-csi-role" { 
  name = "eks-ebs-csi-role"
  assume_role_policy = data.aws_iam_policy_document.ebs-assume-role-policy.json
}

resource "aws_iam_role_policy_attachment" "ebs-csi-role-attachment" { 
  role = aws_iam_role.ebs-csi-role.name
  policy_arn = data.aws_iam_policy.ebs-csi-managed-policy.arn
}

data "aws_iam_role" "ebs-role" { 
  name = aws_iam_role.ebs-csi-role.name
}