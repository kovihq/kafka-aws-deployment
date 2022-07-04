resource "aws_service_discovery_private_dns_namespace" "kad-service-discovery" {
  name = "ecs.local"
  vpc  = var.vpc_id
  tags = var.tags
}

resource "aws_service_discovery_service" "kad-kafka-schema-registry" {
  name = "kad-kafka-schema-registry"
  tags = var.tags
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.kad-service-discovery.id
    dns_records {
      ttl  = 10
      type = "A"
    }
  }
  health_check_custom_config {
    failure_threshold = 1
  }
}

resource "aws_service_discovery_service" "kad-kafka-connect" {
  name = "kad-kafka-connect"
  tags = var.tags
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.kad-service-discovery.id
    dns_records {
      ttl  = 10
      type = "A"
    }
  }
  health_check_custom_config {
    failure_threshold = 1
  }
}

resource "aws_service_discovery_service" "kad-kafka-ksql" {
  name = "kad-kafka-ksql"
  tags = var.tags
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.kad-service-discovery.id
    dns_records {
      ttl  = 10
      type = "A"
    }
  }
  health_check_custom_config {
    failure_threshold = 1
  }
}
