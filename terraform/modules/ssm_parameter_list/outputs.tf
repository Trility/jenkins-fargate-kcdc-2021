output "arns" {
  value = [for parameter in aws_ssm_parameter.parameter : parameter.arn]
}
