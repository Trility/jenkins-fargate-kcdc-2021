variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "jenkins_name" {
  description = "Name for Jenkins Infrastructure"
  type        = string
}

variable "ecr_admins" {
  description = "List of IAM users and roles to grant ECR Admin access"
  type        = list(string)
}

variable "region" {
  description = "AWS Region for deployment"
  type        = string
  default     = "us-west-2"
}

variable "max_ecr_image_count" {
  description = "Maximum number of ECR images retained"
  type        = string
  default     = 30
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}
