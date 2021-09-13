module "iam" {
  aws_account_id = data.aws_caller_identity.current.account_id
  jenkins_name   = local.jenkins_name
  region         = var.region
  tags           = local.tags
  source         = "./iam"
}

module "ecr" {
  aws_account_id = data.aws_caller_identity.current.account_id
  jenkins_name   = local.jenkins_name
  region         = var.region
  tags           = local.tags
  source         = "./ecr"

  ecr_admins = [
    "user/eric"
  ]
}

module "platform" {
  jenkins_name = local.jenkins_name
  region       = var.region
  tags         = local.tags
  subnets      = local.deployment_subnets
  vpc_id       = data.aws_vpc.deployment.id
  source       = "./platform"
}
