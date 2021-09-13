data "aws_caller_identity" "current" {}

data "aws_vpc" "deployment" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_subnets" "deployment" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.deployment.id]
  }

  filter {
    name   = "tag:Name"
    values = [var.subnet_name]
  }
}

data "aws_subnet" "deployment" {
  for_each = toset(data.aws_subnets.deployment.ids)
  id       = each.value
}
