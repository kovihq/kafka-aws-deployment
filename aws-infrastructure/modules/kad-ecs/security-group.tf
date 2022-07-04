resource "aws_security_group" "kad-ecs" {
  name        = var.ecs_cluster_name
  description = "ecs cluster security group"
  vpc_id      = var.vpc_id
  tags        = var.tags

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.kad-ecs-application-lb.id]
    description     = "Application Load Balancer"
  }

  ingress {
    cidr_blocks = [
      "10.0.0.0/16",
    ]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    description = "from itself"
  }

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    cidr_blocks = [var.machine_public_ip_address]
    description = "Access from Local machine"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
