resource "aws_efs_file_system" "fs" {
  encrypted = true
  tags = merge(
    {
      "Name" = var.name
    },
    var.tags
  )

  lifecycle_policy {
    transition_to_ia = var.transition_to_ia
  }
}

resource "aws_efs_access_point" "fs" {
  file_system_id = aws_efs_file_system.fs.id

  posix_user {
    gid = 0
    uid = 0
  }

  root_directory {
    path = "/"
    creation_info {
      owner_gid   = 1000
      owner_uid   = 1000
      permissions = "755"
    }
  }

  tags = var.tags
}

resource "aws_efs_mount_target" "target" {
  for_each = var.subnets

  file_system_id  = aws_efs_file_system.fs.id
  subnet_id       = each.key
  security_groups = var.security_groups
}
