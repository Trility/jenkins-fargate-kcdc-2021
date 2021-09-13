resource "aws_lb_listener" "listener" {
  load_balancer_arn = var.load_balancer_arn
  port              = var.port
  protocol          = var.protocol

  dynamic "default_action" {
    for_each = var.default_action_forward == null ? [] : [var.default_action_forward]

    content {
      type             = "forward"
      target_group_arn = default_action.value.target_group_arn
    }
  }
}
