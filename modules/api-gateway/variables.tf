variable "app_name" {
  description = "Brief identifier for application"
}

variable "app_stage" {
  description = "Application deployment environment (dev, test, prod)"
}
variable "app_description" {
  description = "Brief description of API (for API Gateway)"
}

variable "api_gateway_stage" {
  description = "Name of API deployment stage (for API Gateway)"
  default = ""
}

variable "redeployment_hash" {
  description = "Unique value representing deployed code as well as API Gateway resources"
}

variable "tags" {
  description = "Map of tags to add to compatible resources"
  default = {}
}

locals {
  merged_tags = {
    app_name = "${var.app_name}"
    app_stage = "${var.app_stage}"
  }

  default_tags = "${merge(local.merged_tags, var.tags)}"

  api_gateway_stage = "${var.api_gateway_stage == "" ? var.app_stage : var.api_gateway_stage}"
}

