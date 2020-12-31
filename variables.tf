variable "proj_name" {
  description = "Azure DevOps Project name."
  type        = string
}

variable "proj_description" {
  description = "Azure DevOps Project description."
  type        = string
}

variable "proj_visibility" {
  description = "Project visibility."
  type        = string
  default     = "private"
}

variable "proj_vcs" {
  description = "Project Version Control."
  type        = string
  default     = "Git"
}

variable "proj_wi_template" {
  description = "Project Work Item template."
  type        = string
  default     = "Agile"
}

variable "proj_features" {
  description = "Project features."
  type        = map(string)
  default = {
    "boards"       = "disabled"
    "repositories" = "enabled"
    "pipelines"    = "enabled"
    "testplans"    = "disabled"
    "artifacts"    = "disabled"
  }
}

variable "github_serviceendpoint_name" {
  description = "GitHub Service Endpoint name."
  type        = string
}

variable "github_serviceendpoint_description" {
  description = "GitHub Service Endpoint description."
  type        = string
  default     = "Managed by Terraform"
}

variable "github_pat" {
  description = "The Personal Access Token for Github."
  type        = string
}

variable "vg_name" {
  description = "The name of the Variable Group."
  type        = string
}

variable "vg_description" {
  description = "The description of the Variable Group."
  type        = string
}

variable "vg_allow_access" {
  description = "Boolean that indicate if this variable group is shared by all pipelines of this project."
  type        = bool
  default     = false
}

variable "vg_variables" {
  type = list(object({
    name      = string
    value     = string
    is_secret = bool
  }))
  description = <<EOD
One or more variable blocks as documented below.

A variable block supports the following:

  * name - (Required) The key value used for the variable. Must be unique within the Variable Group.
  * value - (Optional) The value of the variable. If omitted, it will default to empty string.
  * is_secret - (Optional) A boolean flag describing if the variable value is sensitive. Defaults to false.
EOD
  default     = []
}
