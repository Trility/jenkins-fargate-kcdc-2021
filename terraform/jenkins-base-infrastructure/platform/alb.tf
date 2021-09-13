module "alb" {
  name     = var.jenkins_name
  internal = true
  subnets  = keys(var.subnets)
  tags     = var.tags
  source   = "../../modules/alb"

  security_groups = [
    module.alb_security_group.id
  ]
}

module "alb_target_group" {
  name        = var.jenkins_name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
  tags        = var.tags
  source      = "../../modules/alb_target_group"

  health_check = {
    path                = "/login"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

module "alb_listener" {
  load_balancer_arn = module.alb.arn
  port              = 80
  protocol          = "HTTP"
  source            = "../../modules/alb_listener"

  default_action_forward = {
    target_group_arn = module.alb_target_group.arn
  }
}
