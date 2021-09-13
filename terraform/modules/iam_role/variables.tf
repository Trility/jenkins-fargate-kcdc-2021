variable "name" {
  description = "Role name"
  type        = string
}

variable "max_session_duration" {
  description = "Max session duration. Default is 1 hour"
  type        = string
  default     = "3600"
}

variable "policy_arns" {
  description = "Policy ARNs for Role"
  type        = list(string)
  default     = []
}

variable "action" {
  description = "Policy document action"
  type        = string
  default     = "sts:AssumeRole"
}

variable "principals" {
  description = "Principals for role"
  type = list(object({
    type        = string
    identifiers = list(string)
  }))
}

variable "condition" {
  description = "Conditions for the role"
  type = list(object({
    test     = string
    variable = string
    values   = list(string)
  }))
  default = null
}
