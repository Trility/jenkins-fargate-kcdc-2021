variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "jenkins_name" {
  description = "Name for Jenkins Infrastructure"
  type        = string
}

variable "region" {
  description = "AWS Region for deployment"
  type        = string
  default     = "us-west-2"
}

variable "additional_jenkins_policies" {
  description = "List of additional policy arns for Jenkins"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}
