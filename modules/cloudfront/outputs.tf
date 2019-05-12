
output "cloudfront_distro" {
  value = "https://${aws_cloudfront_distribution.cloudfront.domain_name}"
}

output "app_location" {
  value = "https://${var.app_subdomain}.${var.root_domain}"
}