variable "log_groups" {
  description = "Map of repositories to create for the ECR repositories"
  type        = map(string)
}

variable "retention_in_days" {
  description = "Log group retention in days"
  type        = string
  default     = 90
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
