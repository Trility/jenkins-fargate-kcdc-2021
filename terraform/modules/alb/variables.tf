variable "name" {
  description = "Load balancer name"
  type        = string
}

variable "security_groups" {
  description = "Security groups for the Load Balancer"
  type        = list(string)
}

variable "subnets" {
  description = "Subnets for the Load Balancer"
  type        = list(string)
  default     = []
}

variable "internal" {
  description = "Internal load balancer. Default is true"
  type        = bool
  default     = true
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "idle_timeout" {
  description = "Idle timeout for connection. Default is 60"
  type        = string
  default     = 60
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
