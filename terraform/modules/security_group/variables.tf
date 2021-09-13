variable "name" {
  description = "Security Group Name"
  type        = string
}

variable "description" {
  description = "Security Group Description"
  type        = string
}

variable "vpc_id" {
  description = "VPC for Security Group"
  type        = string
}

variable "ingress_rules" {
  description = "Ingress Rules for the Security Group"
  type = list(object({
    cidr_blocks     = list(string)
    from_port       = string
    prefix_list_ids = list(string)
    protocol        = string
    security_groups = list(string)
    to_port         = string
  }))
  default = []
}

variable "egress_rules" {
  description = "Egress Rules for the Security Group"
  type = list(object({
    cidr_blocks     = list(string)
    from_port       = string
    prefix_list_ids = list(string)
    protocol        = string
    security_groups = list(string)
    to_port         = string
  }))
  default = []
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
