
output "cloudfront_distro" {
  value = "https://${aws_cloudfront_distribution.cloudfront.domain_name}"
}

output "cloudfront_host" {
  value = aws_cloudfront_distribution.cloudfront.domain_name
  description = "Hostname of CloudFront distribution, for setting DNS"
}

output "app_location" {
  value = "https://${var.app_subdomain}.${var.root_domain}"
}