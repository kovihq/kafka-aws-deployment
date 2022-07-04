resource "aws_kms_key" "kad-msk" {
  description = "kad-msk"
  tags        = var.tags
}

resource "aws_security_group" "kad-msk" {
  name        = "kad-msk"
  description = "kad-msk security group"
  vpc_id      = var.vpc_id
  tags        = var.tags

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    cidr_blocks = [
      "10.0.0.0/16",
      "10.0.1.0/24",
      "10.0.2.0/24",
      "10.0.3.0/24",
      "10.0.4.0/24",
    ]
    description      = "IOT"
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_msk_configuration" "kad-msk" {
  kafka_versions = [var.msk_kafka_version]
  name           = var.msk_configuration_name

  server_properties = <<PROPERTIES
min.insync.replicas = ${var.msk_min_in_sync_replicas}
default.replication.factor = ${var.msk_default_replication_factor}
auto.create.topics.enable = true
delete.topic.enable = true
PROPERTIES
}

resource "aws_msk_cluster" "kad-msk" {
  cluster_name           = "kad-msk"
  enhanced_monitoring    = "DEFAULT"
  kafka_version          = var.msk_kafka_version
  number_of_broker_nodes = var.msk_number_of_brokers
  tags                   = var.tags

  broker_node_group_info {
    az_distribution = "DEFAULT"
    client_subnets  = var.subnet_ids
    security_groups = [aws_security_group.kad-msk.id]
    instance_type   = var.msk_instance_type

    storage_info {
      ebs_storage_info {
        volume_size = var.msk_ebs_volume_size
      }
    }
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.kad-msk.arn
    encryption_in_transit {
      client_broker = var.msk_encryption_data_in_transit
      in_cluster    = true
    }
  }

  configuration_info {
    arn      = aws_msk_configuration.kad-msk.arn
    revision = aws_msk_configuration.kad-msk.latest_revision
  }
}
