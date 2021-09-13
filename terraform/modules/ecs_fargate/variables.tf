variable "name" {
  description = "Name for the Fargate ECS Cluster"
  type        = string
}

variable "capacity_providers" {
  description = "List of Capacity Providiers"
  type        = list(any)
  default     = ["FARGATE"]
}
variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
