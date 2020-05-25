resource "aws_s3_bucket" "eb-bucket" {
  count = var.create_s3_bucket == true ? 1 : 0
  bucket = "EB-${var.aws_region}-environment"
#  bucket_prefix = "elasticbeanstalk-${var.aws_region}-${var.app_name}"
  region = var.aws_region
  acl    = "private"
  tags = {
    Name  = "eb-bucket"
  }
  versioning {
    enabled = true
  }
}

data " aws_s3_bucket" "eb-bucket" {
  count = var.create_s3_bucket == true ? 0 : 1

resource "aws_s3_bucket_object" "eb-bucket-object" {
  count = var.create_s3_bucket == true ? 1: 0
  bucket = "EB-${var.aws_region}-environment"
  key    = "eb-${var.app_name}-appcode/sample_tomcat.war"
  source = "./sample_tomcat.war"
  depends_on = [
    aws_s3_bucket.eb-bucket,
    ]
}
