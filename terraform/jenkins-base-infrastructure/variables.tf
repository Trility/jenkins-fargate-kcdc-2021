variable "region" {
  description = "AWS Region for deployment"
  type        = string
  default     = "us-west-2"
}

variable "vpc_name" {
  description = "VPC Name for deployment"
  type        = string
  default     = "kcdc-vpc"
}

variable "subnet_name" {
  description = "Subnet Name for deployment"
  type        = string
  default     = "kcdc-private*"
}
