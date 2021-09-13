variable "repositories" {
  description = "Map of repositories to create for the ECR repositories"
  type        = map(string)
}

variable "ecr_repository_policy" {
  description = "ECR Repository Policy"
  type        = string
}

variable "ecr_lifecycle_policy" {
  description = "ECR Lifecycle Policy"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
