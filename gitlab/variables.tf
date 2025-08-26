variable "gitlab_token" {
  description = "The GitLab personal access token."
  type        = string
  sensitive   = true
}

variable "gitlab_base_url" {
  description = "The base URL of the GitLab instance."
  type        = string
  default     = "https://gitlab.com/api/v4/"
}