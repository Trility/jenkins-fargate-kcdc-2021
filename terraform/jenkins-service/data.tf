data "aws_caller_identity" "current" {}

data "terraform_remote_state" "jenkins_base_infrastructure" {
  backend = "s3"

  config = {
    bucket = "kcdc-jenkins-fargate-2021-terraform-backend"
    key    = "jenkins-base-infrastructure"
    region = "us-west-2"
  }
}
