variable "aws_region" {
  description = "The region of AWS where the app is to be deployed"
}
 variable "aws_account_id" {
  description = "AWS account ID in that region where the application needs to be deployed"
}

 variable "vpc_id" {
  description = "VPC ID where the beanstalk environment should be setup"
}

variable "vpc_name" {
  description = "Name of the VPC where the beanstalk environment should be setup"
}

variable "subnet_ids" {
  description = "List of private subnet IDs in the format ["subnet-xxxx1","subnet-xxxxx2",..]"
}

variable "endpoints_required" {
  description = "Boolean 'true' or 'false' stating if any interface endpoints are required"
}

variable "interface_endpoints" {
  description = "List of interface endpoints to be created in the format ["elasticbeanstalk","elasticbeanstalk-health",...]"
}

variable "enable_s3_endpoint" {
  description = "Boolean 'true' or 'false' stating if any S3 gateway endpoint is required"
}

variable "create_eb_roles" {
  description = "Boolean 'true' or 'false' stating if creation of Elastic beanstalk EC2 and service role is required"
  }

variable "ec2_role_name" {
  description = "Role name for the EC2 IAM instance profile in beanstalk"
  }

variable "eb_service_role_name" {
  description = "Elastic Beanstalk service role name"
  }

variable "ec2_policies" {
  description = "The list of policies to attach to EB EC2 role"
}

variable "service_policies" {
  description = "The list of policies to attach to EB service role"
}

variable "app_name" {
  description = "Name of the application to be deployed in EB"
}

variable "app_stack_name" {
  description = "Name of the solution stack for the application"
}

variable "app_version" {
  description = "Version number for the application"
}

variable "instance_type" {
  description = "The type of EC2 inmstance to be created in EB"
}

variable "min_autoscale_num" {
  description = "  Minimum no. of instances required anytime to run in the EB"
}

variable "max_autoscale_num" {
  description = "Maximum number upto which the instances can be scaled in EB"
}
