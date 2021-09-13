variable "jenkins_container_image" {
  description = "ECR URL and tag for Jenkins Container Image"
  type        = string
}

variable "region" {
  description = "AWS Region for deployment"
  type        = string
  default     = "us-west-2"
}
