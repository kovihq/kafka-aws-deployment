resource "aws_vpc" "kad-vpc" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name        = "kad-vpc"
    Application = "Kafka"
    Service     = "tracking"
    Environment = "Prod"
    Domain      = "FleetTracking"
    Squad       = "FleetTracking"
    Tribe       = "Fleet"
    Product     = "FleetTracking"
  }
}
