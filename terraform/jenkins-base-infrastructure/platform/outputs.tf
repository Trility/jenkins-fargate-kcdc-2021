output "efs_id" {
  value = module.efs.id
}

output "efs_access_id" {
  value = module.efs.access_id
}

output "jenkins_cluster_arn" {
  value = module.ecs.arn
}

output "jenkins_workers_cluster_arn" {
  value = module.ecs_workers.arn
}

output "jenkins_address" {
  value = module.alb.dns_name
}

output "jenkins_target_group" {
  value = module.alb_target_group.arn
}

output "jenkins_security_group" {
  value = module.jenkins_security_group.id
}

output "jenkins_log_group" {
  value = aws_cloudwatch_log_group.jenkins.name
}

output "jenkins_worker_log_groups" {
  value = module.log_groups.names
}

output "service_discovery_arn" {
  value = aws_service_discovery_service.controller.arn
}
