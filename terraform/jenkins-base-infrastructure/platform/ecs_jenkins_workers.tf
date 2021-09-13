module "ecs_workers" {
  name               = "${var.jenkins_name}-workers"
  tags               = var.tags
  capacity_providers = ["FARGATE"]
  source             = "../../modules/ecs_fargate"
}
