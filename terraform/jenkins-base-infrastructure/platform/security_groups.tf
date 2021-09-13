module "efs_security_group" {
  name        = "${var.jenkins_name}-efs"
  description = "Security Group for EFS Mount Targets"
  vpc_id      = var.vpc_id
  tags        = var.tags
  source      = "../../modules/security_group"

  ingress_rules = [
    {
      from_port       = 2049
      to_port         = 2049
      protocol        = "tcp"
      cidr_blocks     = [data.aws_vpc.deployment.cidr_block]
      prefix_list_ids = []
      security_groups = []
    }
  ]

  egress_rules = [
    {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
      prefix_list_ids = []
      security_groups = []
    }
  ]
}

module "alb_security_group" {
  name        = "${var.jenkins_name}-alb"
  description = "Security Group for ALB"
  vpc_id      = var.vpc_id
  tags        = var.tags
  source      = "../../modules/security_group"

  ingress_rules = [
    {
      from_port       = 80
      to_port         = 80
      protocol        = "tcp"
      cidr_blocks     = [data.aws_vpc.deployment.cidr_block]
      prefix_list_ids = []
      security_groups = []
    }
  ]

  egress_rules = [
    {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = [data.aws_vpc.deployment.cidr_block]
      prefix_list_ids = []
      security_groups = []
    }
  ]
}

module "jenkins_security_group" {
  name        = var.jenkins_name
  description = "Security Group for Jenkins"
  vpc_id      = var.vpc_id
  tags        = var.tags
  source      = "../../modules/security_group"

  ingress_rules = [
    {
      from_port       = 2049
      to_port         = 2049
      protocol        = "tcp"
      cidr_blocks     = [data.aws_vpc.deployment.cidr_block]
      prefix_list_ids = []
      security_groups = []
    },
    {
      from_port       = 8080
      to_port         = 8080
      protocol        = "tcp"
      cidr_blocks     = [data.aws_vpc.deployment.cidr_block]
      prefix_list_ids = []
      security_groups = []
    },
    {
      from_port       = 50000
      to_port         = 50000
      protocol        = "tcp"
      cidr_blocks     = [data.aws_vpc.deployment.cidr_block]
      prefix_list_ids = []
      security_groups = []
    }
  ]

  egress_rules = [
    {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"]
      prefix_list_ids = []
      security_groups = []
    }
  ]
}
