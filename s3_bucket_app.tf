resource "aws_s3_bucket" "eb-bucket" {
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

resource "aws_s3_bucket_object" "eb-bucket-object" {
  bucket = "EB-${var.aws_region}-environment"
  key    = "eb-${var.app_name}-appcode/sample_tomcat.war"
  source = "./sample_tomcat.war"
  depends_on = [
    aws_s3_bucket.eb-bucket,
    ]
}
