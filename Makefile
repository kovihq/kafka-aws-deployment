tf_plan:  tf_plan_vpc tf_plan_msk  tf_plan_ecs
tf_apply:  tf_apply_vpc tf_apply_msk  tf_apply_ecs
tf_destroy: tf_destroy_ecs tf_destroy_msk tf_destroy_vpc
tf_init: tf_init_ecs tf_init_msk tf_init_vpc

tf_init_vpc:
	@echo Initializing VPC
	(cd aws-infrastructure/deployment/kad-vpc; terraform init -backend-config="../../configuration/terraform-backend.tfvars")

tf_plan_vpc:
	@echo Plan VPC
	(cd aws-infrastructure/deployment/kad-vpc; terraform plan -var-file="../../configuration/global-config.tfvars")

tf_apply_vpc:
	@echo Apply VPC
	(cd aws-infrastructure/deployment/kad-vpc; terraform apply -auto-approve -var-file="../../configuration/global-config.tfvars")

tf_destroy_vpc:
	@echo Destroying VPC
	(cd aws-infrastructure/deployment/kad-vpc; terraform destroy -auto-approve -var-file="../../configuration/global-config.tfvars")

tf_init_msk:
	@echo Initializing MSK
	(cd aws-infrastructure/deployment/kad-msk; terraform init -backend-config="../../configuration/terraform-backend.tfvars")

tf_plan_msk:
	@echo Plan MSK
	(cd aws-infrastructure/deployment/kad-msk; terraform plan -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/msk-config.tfvars")

tf_apply_msk:
	@echo Apply MSK
	(cd aws-infrastructure/deployment/kad-msk; terraform apply -auto-approve -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/msk-config.tfvars")

tf_destroy_msk:
	@echo Destroying MSK
	(cd aws-infrastructure/deployment/kad-msk; terraform destroy -auto-approve -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/msk-config.tfvars")

tf_init_ecs:
	@echo Initializing ECS
	(cd aws-infrastructure/deployment/kad-ecs; terraform init -backend-config="../../configuration/terraform-backend.tfvars")

tf_plan_ecs:
	@echo Plan ECS
	(cd aws-infrastructure/deployment/kad-ecs; terraform plan -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/ecs-config.tfvars")

tf_apply_ecs:
	@echo Apply ECS
	(cd aws-infrastructure/deployment/kad-ecs; terraform apply -auto-approve -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/ecs-config.tfvars")

tf_destroy_ecs:
	@echo Destroying ECS
	(cd aws-infrastructure/deployment/kad-ecs; terraform destroy -auto-approve -var-file="../../configuration/global-config.tfvars" -var-file="../../configuration/ecs-config.tfvars")
