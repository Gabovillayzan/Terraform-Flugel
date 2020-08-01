# Terraform-Flugel
AWS Terraform + Terratest

The Terraform code creates a AWS S3 bucket with two files. 
The content of these files are the timestamp of the exectution time.
Terratest is used for test automation, it validates that the bucket and the files are created successfully. 

## Steps:

Change line 20 of main.tf with a proper path   ["D:\\Path_to\\project_Dir\\"]IaC\\out\

get the AWS required plugin with TERRAFORM INIT
1. >cd IaC
2. >Terraform init

exec the test:

3. >cd ..
4. >cd test
5. >go test -run TerraformS3
