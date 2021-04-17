variable "github_pat" {}
variable "users_object_ids" {}

variable "tags" {
  type = map(string)
  default = {
    ManagedBy   = "Terraform"
    Project     = "DemoLab"
    Environment = "Management"
  }
}
