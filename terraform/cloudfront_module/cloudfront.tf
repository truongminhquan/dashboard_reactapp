locals {
  alb_origin_id = "myAlbOrigin"
}

resource "aws_cloudfront_distribution" "alb_distribution" {
    origin {
        domain_name = aws_lb.my_alb.dns_name
        origin_id   = local.alb_origin_id
        custom_origin_config {
            http_port = "80"
            https_port = "443"
            origin_protocol_policy = "http-only"
            origin_ssl_protocols = ["SSLv3"]
        }
    }
    enabled             = true
    # aliases = ["myalbsite.example.com"]



    default_cache_behavior {
        allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
        cached_methods   = ["GET", "HEAD"]
        target_origin_id = local.alb_origin_id

        forwarded_values {
            query_string = false

            cookies {
                forward = "none"
            }
        }

        viewer_protocol_policy = "allow-all"
        min_ttl                = 0
        default_ttl            = 3600
        max_ttl                = 86400
    }

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    viewer_certificate {
        cloudfront_default_certificate = true
    }
}