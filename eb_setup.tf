## Describing application name ##

resource "aws_elastic_beanstalk_application" "app" {
  name = var.app_name
  description = "AWS Elastic Beanstalk - ${var.app_name} App"
}

## Creating EB application version to source code from S3 ##

resource "aws_elastic_beanstalk_application_version" "app-code" {
  name        = "${var.app_name}-${var.app_version}"
  application = var.app_name
  description = "Elastic Beanstalk application - ${var.app_name}-${var.app_version}"
  bucket = aws_s3_bucket.eb-bucket.id || data.aws_s3_bucket.eb-bucket.id
  key = aws_s3_bucket_object.eb-bucket-object.id || data.aws_s3_bucket_object.eb-bucket-object.id
#  bucket      = var.s3_bucket_name  
#  key         = aws_s3_bucket_object.eb-bucket-object.id
  
}

## Creating the EB environment ##

resource "aws_elastic_beanstalk_environment" "app-env" {
  name = "${var.app_name}-app-env"
  application = aws_elastic_beanstalk_application.app.name
  solution_stack_name = var.app_stack_name
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "Subnets"
    value = join(",", data.aws_subnet.private.*.id)
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "AssociatePublicIpAddress"
    value = "false"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = data.aws_iam_role.eb-ec2-role.name
  }
#  setting {
#    namespace = "aws:autoscaling:launchconfiguration"
#    name = "SecurityGroups"
#    value = aws_security_group.eb-vpc-sg.id
#  }

#  setting {
#    namespace = "aws:autoscaling:launchconfiguration"
#    name = "EC2KeyName"
#    value = aws_key_pair.eb-ec2-key-pair.key_name
#  }

  setting {
    namespace = "aws:ec2:instances"
    name = "InstanceTypes"
    value = var.instance_type
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "ServiceRole"
    value = data.aws_iam_role.eb-service-role.name
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "LoadBalancerType"
    value = "application"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "ELBScheme"
    value = "internal"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "ELBSubnets"
    value = join(",", data.aws_subnet_private.*.id)
  }

## Settings for Classic load balancer ##
#  setting {
#    namespace = "aws:elb:loadbalancer"
#    name = "SecurityGroups"
#    value = aws_security_group.eb-lb-sg.id
#  }
#  setting {
#    namespace = "aws:elb:loadbalancer"
#    name = "ManagedSecurityGroup"
#    value = aws_security_group.eb-lb-sg.id
#  }

## Settings for Application Load Balancer ##
  setting {
    namespace = "aws:elbv2:loadbalancer"
    name = "SecurityGroups"
    value = aws_security_group.eb-lb-sg.id
  }
  setting {
    namespace = "aws:elbv2:loadbalancer"
    name = "ManagedSecurityGroup"
    value = aws_security_group.eb-lb-sg.id
  }

#  setting {
#    namespace = "aws:elb:loadbalancer"
#    name = "CrossZone"
#    value = "true"
#  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSize"
    value = "30"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSizeType"
    value = "Percentage"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name = "Availability Zones"
    value = "Any"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name = "MinSize"
    value = var.min_autoscale_num
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name = "MaxSize"
    value = var.max_autoscale_num
  }

#  setting {
#     namespace = "aws:elasticbeanstalk:cloudwatch:logs"
#        name = "DeleteOnTerminate"
#        value = "true"
#  }

  ## Below settings applicable only if its Application Load Balancer ##

#  setting {
#     namespace = "aws:elbv2:loadbalancer"
#        name = "AccessLogsS3Bucket"
#        value = "elasticbeanstalk-${var.aws_region}-${var.aws_account_id}"
#  }
#  setting {
#     namespace = "aws:elbv2:loadbalancer"
#        name = "AccessLogsS3Enabled"
#        value = "true"
#  }
#  setting {
#     namespace = "aws:elbv2:loadbalancer"
#        name = "AccessLogsS3Prefix"
#        value = var.app_name
#  }
  depends_on = [
#    aws_key_pair.eb-ec2-key-pair,
#    aws_security_group.eb-vpc-sg,
    aws_security_group.eb-lb-sg,
    aws_s3_bucket_object.eb-bucket-object,
#    aws_iam_policy_attachment.eb-ec2-role-attach,
#    aws_iam_policy_attachment.eb-service-role-attach,
  ]
}
