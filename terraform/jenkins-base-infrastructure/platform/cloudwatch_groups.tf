resource "aws_cloudwatch_log_group" "jenkins" {
  name              = "/ecs/${var.jenkins_name}/controller"
  retention_in_days = 90
  tags              = var.tags
}

module "log_groups" {
  tags   = var.tags
  source = "../../modules/cloudwatch_log_group_list"

  log_groups = {
    eng    = "/ecs/${var.jenkins_name}/workers/eng"
    docker = "/ecs/${var.jenkins_name}/workers/docker"
    python = "/ecs/${var.jenkins_name}/workers/python"
  }
}
