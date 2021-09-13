resource "aws_ecr_repository" "repository" {
  for_each = var.repositories

  name = each.value
  tags = merge(
    {
      "Name" = each.value
    },
    var.tags
  )
}

resource "aws_ecr_lifecycle_policy" "lifecycle" {
  for_each = {
    for repository in aws_ecr_repository.repository :
    repository.name => repository.repository_url
  }

  repository = each.key
  policy     = var.ecr_lifecycle_policy
}

resource "aws_ecr_repository_policy" "policy" {
  for_each = {
    for repository in aws_ecr_repository.repository :
    repository.name => repository.repository_url
  }

  repository = each.key
  policy     = var.ecr_repository_policy
}
