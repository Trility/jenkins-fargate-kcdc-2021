resource "aws_lb_target_group" "group" {
  name        = var.name
  port        = var.port
  protocol    = var.protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  tags = merge(
    {
      "Name" = var.name
    },
    var.tags
  )

  dynamic "health_check" {
    for_each = var.health_check == null ? [] : [var.health_check]

    content {
      enabled             = true
      healthy_threshold   = health_check.value.healthy_threshold
      path                = health_check.value.path
      port                = health_check.value.port
      unhealthy_threshold = health_check.value.unhealthy_threshold
    }
  }

  stickiness {
    type    = "lb_cookie"
    enabled = var.protocol == "TCP" ? false : true
  }

  lifecycle {
    create_before_destroy = true
  }
}
