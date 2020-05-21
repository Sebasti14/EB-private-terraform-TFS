# AWS vars
aws_region = "us-east-1"
aws_account_id = "188251670453"

# VPC, Subnets vars
vpc_id = ""
vpc_name = ""
subnets = ["",""]

# IAM role policy vars
ec2_policies = ["AWSElasticBeanstalkWebTier","AWSElasticBeanstalkMulticontainerDocker","AWSElasticBeanstalkWorkerTier"]
service_policies = ["AWSElasticBeanstalkEnhancedHealth","AWSElasticBeanstalkService"]

# EC2, Autoscaling vars
instance_type = "t2.micro"
min_autoscale_num = 1
max_autoscale_num = 4

# EB application vars
app_name = "sample_tomcat"
app_stack_name = "64bit Amazon Linux 2018.03 v3.3.4 running Tomcat 8.5 Java 8"
app_version = "1.1"


