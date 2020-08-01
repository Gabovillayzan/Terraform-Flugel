#version 1.0
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "myBucket" {
  bucket = "flugel-bucket"
  force_destroy = true
  acl    = "public-read"
  provisioner "local-exec" {
    command = <<EOT
    mkdir out
    Get-Date > out/test1.txt
    Get-Date > out/test2.txt
    EOT
    interpreter = ["PowerShell", "-Command"]
  }
  provisioner "local-exec" {
    command = <<EOT
    aws s3 cp D:\\Projects\\Terraform-Flugel2\\Terraform-Flugel\\IaC\\out\  s3://${aws_s3_bucket.myBucket.id} --acl public-read --recursive --exclude "*" --include "*.txt"
    EOT
  }
  tags = {
    Name        = "flugel-bucket"
    Environment = "Dev"
  }
}

output "BucketID" {
  value = "${aws_s3_bucket.myBucket.id}"
  
}