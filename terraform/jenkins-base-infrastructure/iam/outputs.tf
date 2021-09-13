output "jenkins_role" {
  value = module.jenkins_role.arn
}

output "jenkins_eng_role" {
  value = module.jenkins_eng_role.arn
}

output "jenkins_python_role" {
  value = module.jenkins_python_role.arn
}
