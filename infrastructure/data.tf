data "aws_iam_policy_document" "ebs-assume-role-policy" { 
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type = "Federated"
      identifiers = [module.eks.oidc_provider_arn]
    }
    condition {
     test = "StringEquals"
     variable = "${module.eks.oidc_provider}:aud"
     values = ["sts.amazonaws.com"]
    }
  }
}

data "aws_iam_policy" "ebs-csi-managed-policy" { 
  name = "AmazonEBSCSIDriverPolicy"
}