# kennship/web/aws//modules/lambda-gateway-permissions

> Set up API Gateway permissions for multiple Lambda functions

## Variables

- **`lambda_arn_list`:** List of ARNs for Lambda functions you wish to associate with the API Gateway
- **`execution_arn`:** Value of aws_api_gateway_rest_api.api.execution_arn, or the execution_arn output of the related api-gateway module