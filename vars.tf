variable "aws_region" {
  description = "The region of AWS where the app is to be deployed"
}
 variable "aws_account_id" {
  description = "AWS account ID in that region where the application needs to be deployed"
}

variable "aws_subnet_count" {
  description = "The number of subnets required in VPC"
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
  description = "maximum number upto which the instances can be scaled in EB"
}
