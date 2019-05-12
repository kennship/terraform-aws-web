locals {
  s3_origin_id = "FrontendAssets"
}

resource "aws_cloudfront_distribution" "cloudfront" {
  origin {
    domain_name = "${var.static_asset_bucket}.s3.amazonaws.com"
    origin_path = "/apps/${var.app_name}/${local.deployment_id}"
    origin_id   = "${local.s3_origin_id}"

    s3_origin_config = {
      origin_access_identity = "${aws_cloudfront_origin_access_identity.access.cloudfront_access_identity_path}"
    }
  }

  enabled             = true
  default_root_object = "index.html"
  aliases  = ["${var.app_subdomain}.${var.root_domain}"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${local.s3_origin_id}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "all"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
  }

  custom_error_response {
    # Keep in mind that S3 serves "403 Forbidden" for not-found files,
    # since in general you do not even have permission to see whether
    # the object exists. Peasant.
    error_code         = 403
    response_page_path = "/index.html"
    response_code      = 200
  }

  price_class = "PriceClass_200"

  viewer_certificate {
    acm_certificate_arn = "${var.tls_certificate_arn}"
    ssl_support_method = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  
  tags = "${local.tags}"
}

resource "aws_cloudfront_origin_access_identity" "access" {}
