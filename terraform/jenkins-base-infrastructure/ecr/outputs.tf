output "repository_names" {
  value = module.jenkins_ecr_repositories.names
}

output "repository_urls" {
  value = module.jenkins_ecr_repositories.repository_urls
}
