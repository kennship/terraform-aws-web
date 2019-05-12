variable "app_name" {
  description = "Short identifier for your app"
}

variable "app_stage" {
  description = "Deployment environment (such as 'dev', 'test', or 'prod')"
}

variable "deployment_id" {
  description = "Short identifier uniquely identifying a given release (can be 'dev', 'test', 'prod', or a shortened Git hash)"
  default = ""
}

variable "root_domain" {
  description = "Root domain into which this CloudFront distribution will be added (such as 'example.net')"
}

variable "app_subdomain" {
  description = "Subdomain of this CloudFront distribution (such as 'www')"
}

variable "static_asset_bucket" {
  description = "Name of S3 bucket hosting static assets (via S3 website feature)"
}

variable "tls_certificate_arn" {
  description = "ARN of Amazon Certificate Manager certificate"
}

variable "tags" {
  description = "Tags to associate with this CloudFront distribution"
  default = {}
}

locals {
  deployment_id = "${var.deployment_id == "" ? var.app_stage : var.deployment_id}"
  tags = "${merge(map("app_name", var.app_name, "app_stage", var.app_stage), var.tags)}"
}