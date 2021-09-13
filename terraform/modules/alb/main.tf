resource "aws_lb" "lb" {
  name               = var.name
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnets
  internal           = var.internal
  idle_timeout       = var.idle_timeout

  tags = merge(
    {
      "Name" = var.name
    },
    var.tags
  )
}
