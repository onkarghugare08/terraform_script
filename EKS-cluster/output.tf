output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_region" {
  value = var.region
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "configure_kubectl" {
  value = "aws eks update-kubeconfig --name ${module.eks.cluster_name} --region ${var.region}"
}