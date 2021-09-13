variable "jenkins_name" {
  description = "Name for Jenkins Infrastructure"
  type        = string
}

variable "vpc_id" {
  description = "Deployment VPC ID"
  type        = string
}

variable "subnets" {
  description = "Subnet IDs for EFS Mount Targets"
  type        = map(string)
}

variable "region" {
  description = "AWS Region for deployment"
  type        = string
  default     = "us-west-2"
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}
