variable "github_pat" {}

variable "tags" {
  type = map(string)
  default = {
    Environment = "management"
  }
}
