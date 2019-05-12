variable "lambda_arn_list" {
  description = "List of ARNs for Lambda functions you wish to associate with the API Gateway"
  type = "list"
}

variable "execution_arn" {
  description = "Value of aws_api_gateway_rest_api.api.execution_arn, or the execution_arn output of the related api-gateway module"
}