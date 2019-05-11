# kennship/web/aws//modules/api-gateway

> Opinionated API Gateway setup

## Variables

- **`app_name`:** Brief identifier for application
- **`app_stage`:** Application deployment environment (dev, test, prod)
- **`app_description`:**` Brief description of API (for API Gateway)
- **`api_gateway_stage`:** Name of API deployment stage (for API Gateway -- optional, will be provided by `app_stage` if empty)
- **`redeployment_hash`:** Unique value representing deployed code as well as API Gateway resources
- **`tags`:** Map of tags to add to compatible resources (default `{}`)

## Outputs

- **`api_invoke_url`**
- **`rest_api_id`**
- **`root_resource_id`**
- **`execution_arn`**
- **`api_gateway_stage_name`**