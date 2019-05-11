
resource "aws_api_gateway_resource" "resource" {
  count       = "${var.create_resource ? 1 : 0}"
  rest_api_id = "${var.rest_api_id}"
  parent_id   = "${local.parent_resource_id}"
  path_part   = "${var.resource_path_part}"
}

resource "aws_api_gateway_method" "method" {
  rest_api_id   = "${var.rest_api_id}"
  http_method   = "${var.http_method}"
  authorization = "${var.authorization}"
  authorizer_id = "${var.authorizer_id}"
  resource_id   = "${local.attached_resource_id}"
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id = "${var.rest_api_id}"
  resource_id = "${aws_api_gateway_method.method.resource_id}"
  http_method = "${aws_api_gateway_method.method.http_method}"

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${var.lambda_invoke_arn}"
}
