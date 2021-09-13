locals {
  jenkins_name = terraform.workspace == "default" ? "kcdc-jenkins" : "kcdc-jenkins-${terraform.workspace}"

  tags = {
    Owner     = "KCDC Demo"
    Workspace = terraform.workspace
  }

  deployment_subnets = {
    for subnet in data.aws_subnet.deployment :
    subnet.id => subnet.cidr_block
  }
}
