output "names" {
  value = [for group in aws_cloudwatch_log_group.group : group.name]
}
