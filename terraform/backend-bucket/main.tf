resource "aws_s3_bucket" "bucket" {
  bucket        = "kcdc-jenkins-fargate-2021-terraform-backend"
  acl           = "private"
  force_destroy = true
  tags = {
    Name  = "kcdc-jenkins-fargate-2021-terraform-backend"
    Owner = "KCDC Demo"
  }

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
