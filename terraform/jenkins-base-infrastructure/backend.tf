terraform {
  backend "s3" {
    bucket               = "kcdc-jenkins-fargate-2021-terraform-backend"
    key                  = "jenkins-base-infrastructure"
    region               = "us-west-2"
    encrypt              = true
    workspace_key_prefix = "workspaces"
  }
}
