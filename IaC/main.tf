#version 1.0
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "myBucket" {
  bucket = "flugel-bucket"
  //for this test is useful that the bucket allows deleting it even if it has files inside. 
  force_destroy = true
  acl    = "public-read"
  //those commands save the current time to the files required in the local environment
  provisioner "local-exec" {
    command = <<EOT
    mkdir out
    Get-Date > out/test1.txt
    Get-Date > out/test2.txt
    EOT
    interpreter = ["PowerShell", "-Command"]
  }
  //uploading the previous files to S3... important to verify the path you are using here!
  provisioner "local-exec" {
    command = <<EOT
    aws s3 cp D:\\Projects\\TerraformFlugel2\\Terraform-Flugel\\IaC\\out\  s3://${aws_s3_bucket.myBucket.id} --acl public-read --recursive --exclude "*" --include "*.txt"
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