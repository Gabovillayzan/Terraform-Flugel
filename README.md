# Terraform-Flugel
AWS Terraform + Terratest

Steps:
Change line 20 of main.tf with a proper path   ["D:\\Path_to\\project_Dir\\"]IaC\\out\
get the AWS required plugin with TERRAFORM INIT
1. >cd IaC
2. >Terraform init
exec the test:
3. >cd ..
4. >cd test
5. >go test -run TerraformS3
