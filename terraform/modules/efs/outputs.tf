output "id" {
  value = aws_efs_file_system.fs.id
}

output "arn" {
  value = aws_efs_file_system.fs.arn
}

output "dns_name" {
  value = aws_efs_file_system.fs.dns_name
}

output "mount_targets" {
  value = [for target in aws_efs_mount_target.target : target.dns_name]
}

output "access_id" {
  value = aws_efs_access_point.fs.id
}
