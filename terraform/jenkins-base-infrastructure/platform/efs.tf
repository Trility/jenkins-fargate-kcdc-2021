module "efs" {
  name    = "${var.jenkins_name}-efs"
  subnets = var.subnets
  tags    = var.tags
  source  = "../../modules/efs"

  security_groups = [
    module.efs_security_group.id
  ]
}
