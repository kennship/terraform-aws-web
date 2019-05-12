resource "aws_lambda_permission" "apigw_auth" {
  count = "${length(var.lambda_arn_list)}"

  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${element(var.lambda_arn_list, count.index)}"
  principal     = "apigateway.amazonaws.com"

  # The /*/* portion grants access from any method on any resource
  # within the API Gateway "REST API".
  source_arn = "${var.execution_arn}/*/*/*"
}
