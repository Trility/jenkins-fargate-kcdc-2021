variable "name" {
  description = "Target group name"
  type        = string
}

variable "port" {
  description = "Port for the Target Group"
  type        = string
}

variable "protocol" {
  description = "Protocol type for the Target Group"
  type        = string
}

variable "vpc_id" {
  description = "VPC Id for where the Instances are hosted"
  type        = string
}

variable "target_type" {
  description = "Target type. Default is instance"
  type        = string
  default     = "instance"
}

variable "health_check" {
  description = "Health check for target group"
  type = object({
    healthy_threshold   = string
    path                = string
    port                = string
    unhealthy_threshold = string
  })
  default = null
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
