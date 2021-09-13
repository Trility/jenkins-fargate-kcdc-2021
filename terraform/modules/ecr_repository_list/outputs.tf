output "names" {
  value = [for repository in aws_ecr_repository.repository : repository.name]
}

output "repository_urls" {
  value = [for repository in aws_ecr_repository.repository : repository.repository_url]
}
