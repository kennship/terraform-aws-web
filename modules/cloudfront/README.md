# kennship/web/aws//modules/cloudfront

> Opinionated module for delivering a static web app.

## Assumptions

This module assumes that:
- your app's static assets are hosted in S3,
- you have enabled S3 Website Hosting for this bucket,
- you store the assets for a given app and deployment environment at the path `apps/${app_name}/${deployment_id}` (`deployment_id` being a short string such as "dev". "test", or "prod", or else a fixed identifier such as a Git hash), and
- you will be using Route53 and an Amazon Certificate Manager certificate to serve this content from a domain you control.

## Variables

- **`app_name`:** Short identifier for your app
- **`app_stage`:** Deployment environment (such as 'dev', 'test', or 'prod')
- **`deployment_id`:** Short identifier uniquely identifying a given release (can be 'dev', 'test', 'prod', or a shortened Git hash)
- **`root_domain`:** Root domain into which this CloudFront distribution will be added (such as 'example.net')
- **`app_subdomain`:** Subdomain of this CloudFront distribution (such as 'www')
- **`static_asset_bucket`:** Name of S3 bucket hosting static assets (via S3 website feature)
- **`tls_certificate_arn`:** ARN of Amazon Certificate Manager certificate
- **`tags`:** Tags to associate with this CloudFront distribution (default `{}`)
- **`lambda_function_associations`:** List of `{event_type, lambda_arn, include_body}` objects representing Lambda function associations for the CloudFront distribution. (default = `[]`)
    > Example:
    > ```
    >  lambda_function_associations = [
    >    {
    >      event_type = "viewer-request",
    >      lambda_arn = aws_lambda_function.html_redirect_lambda.qualified_arn,
    >      include_body = false
    >    }
    >  ]
    >  ```

## Outputs

- **`cloudfront_distro`:** URL of raw CloudFront distribution
- **`app_location`:** URL of your application's entry point
