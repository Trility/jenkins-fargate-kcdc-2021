module "ecs" {
  name   = var.jenkins_name
  tags   = var.tags
  source = "../../modules/ecs_fargate"
}
