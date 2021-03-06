# AWS vars
aws_region = "us-east-1"
aws_account_id = "188251670453"

# VPC, Subnets vars
vpc_id = "vpc-071c2bff610c5196a"
vpc_name = "priv-vpc"
subnet_ids = ["subnet-03f38717dce618340","subnet-006cf63f5cf79247d"]

# Endpoint vars
endpoints_required = "false"
interface_endpoints = ["elasticbeanstalk",".elasticbeanstalk-health","cloudformation","monitoring","sqs"]
enable_s3_endpoint = "false"

# IAM role policy vars
create_eb_roles = "false"
ec2_role_name = "aws-elasticbeanstalk-ec2-role"
eb_service_role_name = "aws-elasticbeanstalk-service-role"
ec2_policies = ["AWSElasticBeanstalkWebTier","AWSElasticBeanstalkMulticontainerDocker","AWSElasticBeanstalkWorkerTier"]
service_policies = ["AWSElasticBeanstalkEnhancedHealth","AWSElasticBeanstalkService"]

# S3 bucket vars
create_s3_bucket= "true"
s3_bucket_name = ""
s3_object_path = ""

# EC2, Autoscaling vars
instance_type = "t2.micro"
min_autoscale_num = 1
max_autoscale_num = 4

# EB application vars
app_name = "sample_tomcat"
app_stack_name = "64bit Amazon Linux 2018.03 v3.3.4 running Tomcat 8.5 Java 8"
app_version = "1.1"


