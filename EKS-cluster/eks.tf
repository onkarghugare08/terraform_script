module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"
  
  name               = var.cluster_name
  kubernetes_version = var.cluster_version 
  endpoint_public_access = true
  endpoint_private_access = true

  # Needed for your local kubectl to coordinate configuration natively
  enable_cluster_creator_admin_permissions = true
 
  # EKS Add-ons (latest versions auto-resolved)
  addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent    = true
      before_compute = true # Deploy before node groups to avoid networking issues
    }
    eks-pod-identity-agent = {
      most_recent    = true
      before_compute = true # Enables pod-level IAM via Pod Identity
    }
  }
  

   vpc_id                   = module.vpc.vpc_id
   subnet_ids               = module.vpc.private_subnets
   control_plane_subnet_ids = module.vpc.intra_subnets

  eks_managed_node_groups = {
    my_eks_nodes = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = [var.node_instance_type]

      min_size     = 1
      max_size     = 3
      desired_size = var.node_desired_count
    }
  }

  tags = {
    Environment = "dev"
    Project     = "My_EKS_Cluster"
    ManagedBy   = "Terraform"
  }
}
