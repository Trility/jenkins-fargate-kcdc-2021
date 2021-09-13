resource "aws_service_discovery_private_dns_namespace" "controller" {
  name        = var.jenkins_name
  vpc         = var.vpc_id
  description = "Serverless Jenkins discovery managed zone."
}


resource "aws_service_discovery_service" "controller" {
  name = "controller"

  dns_config {
    namespace_id   = aws_service_discovery_private_dns_namespace.controller.id
    routing_policy = "MULTIVALUE"

    dns_records {
      ttl  = 10
      type = "A"
    }

    dns_records {
      ttl  = 10
      type = "SRV"
    }
  }

  health_check_custom_config {
    failure_threshold = 5
  }
}
