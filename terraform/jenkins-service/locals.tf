locals {
  jenkins_name = terraform.workspace == "default" ? "kcdc-jenkins" : "kcdc-jenkins-${terraform.workspace}"

  cpu    = 2048
  memory = 4096

  tags = {
    Owner     = "KCDC Demo"
    Workspace = terraform.workspace
  }
}
