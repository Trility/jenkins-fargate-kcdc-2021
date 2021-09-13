resource "aws_ssm_parameter" "parameter" {
  for_each = var.parameters

  name  = each.value.name
  type  = each.value.type
  value = each.value.value

  tags = merge(
    {
      "Name" = each.value.name
    },
    var.tags
  )
}
