# NEED CONFIGURATION:

ecs_key_name = "kafka-aws-deployment" # e.g: my_ec2_key

/*
    I recommend using an Amazon ECS-optimized AMI. (https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html)
    If you spin up the cluster in the Sydney region you will find this public AMI: 
    
    AMI Name: amzn-ami-2018.03.w-amazon-ecs-optimized
    AMI Id: ami-0112bb4988eedc594
*/
ecs_image_id = "ami-0f863d7367abe5d6f" # e.g: ami-0112bb4988eedc594


#ECS
ecs_cluster_name               = "kad-ecs"
ecs_instance_type              = "t2.xlarge"
ecs_desired_capacity           = 2
ecs_min_size                   = 1
ecs_max_size                   = 2
image_kafka_schema_registry    = "confluentinc/cp-schema-registry"
image_kafka_schema_registry_ui = "landoop/schema-registry-ui"
image_kafka_connect            = "debezium/connect"
image_kafka_connect_ui         = "landoop/kafka-connect-ui"
image_kafka_rest_api           = "confluentinc/cp-kafka-rest"
image_kafka_ksql               = "confluentinc/ksqldb-server"

ecs_container_kafka_schema_registry_port = 8081
ecs_host_kafka_schema_registry_port      = 8081

ecs_container_kafka_connect_port = 8083
ecs_host_kafka_connect_port      = 8083

ecs_alb_kafka_schema_registry_ui_port       = 9000
ecs_container_kafka_schema_registry_ui_port = 8000
ecs_host_kafka_schema_registry_ui_port      = 8001

ecs_alb_kafka_connect_ui_port       = 9001
ecs_container_kafka_connect_ui_port = 8000
ecs_host_kafka_connect_ui_port      = 8002

ecs_alb_kafka_rest_api_port       = 9002
ecs_container_kafka_rest_api_port = 8082
ecs_host_kafka_rest_api_port      = 8082

ecs_container_kafka_ksql_port = 8088
ecs_host_kafka_ksql_port      = 8088
