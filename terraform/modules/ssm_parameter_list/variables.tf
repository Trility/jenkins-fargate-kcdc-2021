variable "parameters" {
  description = "Map of parameters to create"
  type = map(object({
    name  = string
    type  = string
    value = string
  }))
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
