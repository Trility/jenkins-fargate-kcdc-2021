resource "aws_cloudwatch_log_group" "group" {
  for_each = var.log_groups

  name              = each.value
  retention_in_days = var.retention_in_days
  tags = merge(
    {
      "Name" = each.value
    },
    var.tags
  )
}
