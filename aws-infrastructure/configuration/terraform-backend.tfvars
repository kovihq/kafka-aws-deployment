# NEED CONFIGURATION:

#  S3 bucket to store terraform state file
bucket = "kafka-aws-deployment" # e.g: kad-ap-southeast-2-terraform

# from https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html
region = "us-east-1" # e.g: ap-southeast-2

#From readme file (prerequisites). Done as part of the CLI installation. If you followed the configuration it might have created a profile called `default`
profile = "kovi-prod" # e.g: default
