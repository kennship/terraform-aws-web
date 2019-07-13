variable "lambda_invoke_arn" {
  description = "Invocation ARN of lambda to attach"
}

variable "create_resource" {
  description = "Set to 'true' to create the resource, 'false' otherwise"
  default     = true
}

variable "rest_api_id" {
  description = "ID of the rest API"
}

variable "rest_api_root_resource_id" {
  description = "Root resource ID for the rest API"
}

variable "parent_resource_id" {
  description = "Parent resource"
  default     = "ATTACH_TO_ROOT"
}

variable "resource_path_part" {
  description = "String to append to parent resource path, if new resource is being created"
}

variable "http_method" {
  description = "All-caps HTTP verb"
}

variable "authorization" {
  description = "The type of authorization used for the method (`NONE`, `CUSTOM`, `AWS_IAM`, `COGNITO_USER_POOLS`)"
  default = "NONE"
}

variable "authorizer_id" {
  description = "The authorizer ID to be used when the authorization is `CUSTOM` or `COGNITO_USER_POOLS`. Expected to be the `id` property of an `aws_api_gateway_authorizer` resource"
  default = ""
}

locals {
  parent_resource_id = "${var.parent_resource_id == "ATTACH_TO_ROOT" ? var.rest_api_root_resource_id : var.parent_resource_id}"

  attached_resource_id = "${
    var.create_resource
      ? element(concat(aws_api_gateway_resource.resource.*.id, list("")), 0)
      : local.parent_resource_id
  }"
}
