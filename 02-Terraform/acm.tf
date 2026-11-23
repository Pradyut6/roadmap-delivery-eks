# ==============================================================================
# ACM Certificate for Cloudflare Full (Strict) TLS
# ==============================================================================

resource "aws_acm_certificate" "alb_cert" {
  count             = var.ingress_domain == null ? 0 : 1
  domain_name       = "*.${var.ingress_domain}"
  validation_method = "DNS"

  subject_alternative_names = [var.ingress_domain]

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-alb-cert"
  })

  lifecycle {
    create_before_destroy = true
  }
}
