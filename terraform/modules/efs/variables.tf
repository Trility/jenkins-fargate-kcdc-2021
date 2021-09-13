variable "name" {
  description = "Name for EFS"
  type        = string
}

variable "subnets" {
  description = "Subnet to define a mount target"
  type        = map(any)
}

variable "security_groups" {
  description = "Security groups for the mount target"
  type        = list(string)
}

variable "transition_to_ia" {
  description = "Defines how long before transitioning files to IA storage class. Default is AFTER_30_DAYS"
  type        = string
  default     = "AFTER_30_DAYS"
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
