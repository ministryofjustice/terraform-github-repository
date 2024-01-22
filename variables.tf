variable "tags" {
  type        = map(string)
  description = "Common tags to be used by all resources"
}
variable "application_name" {
  type        = string
  description = "Name of application"
}

variable "name" {
  type        = string
  description = "Repository name"
}

variable "description" {
  type        = string
  description = "Repository description"
}

variable "homepage_url" {
  type        = string
  description = "Repository homepage URL"
  default     = ""
}

variable "secrets" {
  type        = map(any)
  description = "key:value map for GitHub actions secrets"
  default     = {}
}

variable "topics" {
  type    = list(string)
  default = ["operations-engineering"]
}

variable "type" {
  type        = string
  description = "Type of repository: `core`, `module`, `template`. Defaults to `core`"
  default     = "core"
}

variable "visibility" {
  type        = string
  description = "Visibility type: `public`, `internal`, `private`"
  default     = "public"
}

variable "required_checks" {
  type        = list(string)
  description = "List of required checks"
  default     = []
}

variable "has_discussions" {
  type        = bool
  description = "Enable repository discussions"
  default     = false
}
