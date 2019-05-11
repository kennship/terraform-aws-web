# kennship/terraform-aws-web/modules/api-lambda-endpoint

> Creates and integrates an AWS API Gateway Resource with a Lambda function.

## Variables

- **`lambda_invoke_arn`:** Invocation ARN of lambda to attach
- **`create_resource`:** Set to 'true' to create the resource, 'false' otherwise (default `true`)
- **`rest_api_id`:** ID of the REST API
- **`rest_api_root_resource_id`:** Root resource ID for the REST API
- **`parent_resource_id`:** Parent resource (default `"ATTACH_TO_ROOT"`)
- **`resource_path_part`:** String to append to parent resource path, if new resource is being created
- **`http_method`:** All-caps HTTP verb
- **`authorization`:** (default `"NONE"`)
- **`authorizer_id`**

## Outputs

- **`resource_id`**