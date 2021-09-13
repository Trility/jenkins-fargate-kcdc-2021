output "aws_account_id" {
  value = data.aws_caller_identity.current.id
}

output "jenkins_role" {
  value = module.iam.jenkins_role
}

output "jenkins_eng_role" {
  value = module.iam.jenkins_eng_role
}

output "jenkins_python_role" {
  value = module.iam.jenkins_python_role
}

output "ecr_repository_urls" {
  value = module.ecr.repository_urls
}

output "efs_id" {
  value = module.platform.efs_id
}

output "efs_access_id" {
  value = module.platform.efs_access_id
}

output "jenkins_cluster_arn" {
  value = module.platform.jenkins_cluster_arn
}

output "jenkins_workers_cluster_arn" {
  value = module.platform.jenkins_workers_cluster_arn
}

output "jenkins_address" {
  value = "http://${module.platform.jenkins_address}/"
}

output "jenkins_service_target_group" {
  value = module.platform.jenkins_target_group
}

output "jenkins_security_group" {
  value = module.platform.jenkins_security_group
}

output "vpc_id" {
  value = data.aws_vpc.deployment.id
}

output "subnet_ids" {
  value = keys(local.deployment_subnets)
}

output "jenkins_log_group" {
  value = module.platform.jenkins_log_group
}

output "jenkins_worker_log_groups" {
  value = module.platform.jenkins_worker_log_groups
}

output "service_discovery_arn" {
  value = module.platform.service_discovery_arn
}
