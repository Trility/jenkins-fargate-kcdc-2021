resource "aws_ecs_cluster" "fargate_cluster" {
  name               = var.name
  capacity_providers = var.capacity_providers

  tags = merge(
    {
      "Name" = var.name
    },
    var.tags
  )

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
