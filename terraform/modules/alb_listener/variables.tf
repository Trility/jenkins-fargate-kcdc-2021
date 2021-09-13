variable "load_balancer_arn" {
  description = "Load balancer arn"
  type        = string
}

variable "port" {
  description = "Port for the listener"
  type        = string
}

variable "protocol" {
  description = "Protocol type for the listener"
  type        = string
}

variable "default_action_forward" {
  description = "Default action of forward for the listener"
  type = object({
    target_group_arn = string
  })
  default = null
}
