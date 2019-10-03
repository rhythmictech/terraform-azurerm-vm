
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

variable "name" {
  description = "Moniker to apply to all resources in the module"
  type        = string
}

variable "tags" {
  description = "User-Defined tags"
  type        = map(string)
  default     = {}
}

variable "env" {
  description = "Environment to tag resources with"
  type        = string
  default     = "default"
}

locals {

  common_tags = merge(var.tags, {
    Name                = var.name
    env                 = var.env
    terraform_managed   = "true"
    terraform_workspace = terraform.workspace
    })
}
