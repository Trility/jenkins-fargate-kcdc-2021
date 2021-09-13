module "jenkins_parameters" {
  tags   = var.tags
  source = "../../modules/ssm_parameter_list"

  parameters = {
    ssh_key : {
      "name" : "/kcdc/jenkins/JENKINS_GITHUB_SSH_KEY"
      "type" : "SecureString"
      "value" : "ThisValueMustChange"
    },
    ssh_key_username : {
      "name" : "/kcdc/jenkins/JENKINS_GITHUB_SSH_KEY_USERNAME"
      "type" : "SecureString"
      "value" : "ThisValueMustChange"
    }
  }
}
