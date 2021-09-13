resource "aws_security_group" "group" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      cidr_blocks     = egress.value.cidr_blocks
      from_port       = egress.value.from_port
      prefix_list_ids = egress.value.prefix_list_ids
      protocol        = egress.value.protocol
      security_groups = egress.value.security_groups
      to_port         = egress.value.to_port
    }
  }

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      self            = true
      cidr_blocks     = ingress.value.cidr_blocks
      from_port       = ingress.value.from_port
      prefix_list_ids = ingress.value.prefix_list_ids
      protocol        = ingress.value.protocol
      security_groups = ingress.value.security_groups
      to_port         = ingress.value.to_port
    }
  }

  tags = merge(
    {
      "Name" = var.name
    },
    var.tags
  )
}
