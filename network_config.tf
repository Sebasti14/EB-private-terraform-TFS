## Get the VPC ID ##

data "aws_vpc" "eb-vpc" {
  for_each = var.vpc_id
  id = var.vpc_id
# filter {
#    name = var.vpc_name
#   values = var.vpc_name
}


## Create security groups for EB VPC endpoints ##

#resource "aws_security_group" "allow-vpc" {
#  count = var.endpoints_required == true ? 1 : 0
#  name        = "allow_vpc_eb"
#  description = "Allow inbound traffic from VPC"
#  vpc_id      = data.aws_vpc.eb-vpc.id
#
# ingress {
#    description = "TLS from VPC"
#    from_port   = 443
#    to_port     = 443
#    protocol    = "tcp"
#    cidr_blocks = data.aws_vpc.eb-vpc.cidr_block
#  }

#  ingress {
#    description = "HTTP from VPC"
#    from_port   = 80
#    to_port     = 80
#    protocol    = "tcp"
#    cidr_blocks = data.aws_vpc.eb-vpc.cidr_block
#  }


#  egress {
#    from_port   = 0
#   to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }

#  tags = {
#    Name = "allow_vpc_eb"
#  }
#}


## Create Interface VPC endpoints ##

#resource "aws_vpc_endpoint" "eb-int-ep" {
#  for_each = var.interface_endpoints
#  vpc_id            = data.aws_vpc.eb-vpc.id
#  service_name      = "com.amazonaws.${var.aws_region}.${each.value}"
#  vpc_endpoint_type = "Interface"

#  security_group_ids = [
#    aws_security_group.allow-vpc.id,
#  ]
#  subnet_ids = ["${var.subnet_ids}"] ---- use join etc..
#
#  private_dns_enabled = true
#}

## Create Gateway VPC endpoint - S3 ##

#resource "aws_vpc_endpoint" "s3" {
#  count = var.enable_s3_endpoint == true ? 1 : 0
#  vpc_id       = data.aws_vpc.eb-vpc.id
#  service_name = "com.amazonaws.${var.aws_region}.s3"
#}

## Create route table for S3 ##

#resource "aws_route_table" "s3_route" {
#  vpc_id = data.aws_vpc.eb-vpc.id
#}

## Associate S3 endpoint to VPC route table ##

#resource "aws_vpc_endpoint_route_table_association" "s3_route_add" {
#  count = var.enable_s3_endpoint == true ? 1 : 0
#  vpc_endpoint_id = data.aws_vpc_endpoint.s3.id
#  route_table_id  = data.aws_vpc.eb-vpc.main_route_table_id or aws_route_table.s3_route.id
}

