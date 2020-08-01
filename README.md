# Terraform-Flugel
AWS Terraform + Terratest

The Terraform code creates a AWS S3 bucket with two files. 
The content of these files are the timestamp of the exectution time.
Terratest is used for test automation, it validates that the bucket and the files are created successfully. 

## Steps:

Change line 20 of IaC/main.tf with a proper path   ["D:\\Path_to\\project_Dir\\"]IaC\\out\

get the AWS required plugin with TERRAFORM INIT

1. >cd IaC
2. >Terraform init

exec the test:

3. >cd ..
4. >cd test
5. >go test -run TerraformS3


## Output of the terratest:
```shell script
PS D:\Projects\TerraformFlugel2\Terraform-Flugel\test> go test -run TerraformS3
TestTerraformS3 2020-08-01T04:14:03-05:00 retry.go:72: terraform [init -upgrade=false]
TestTerraformS3 2020-08-01T04:14:03-05:00 logger.go:66: Running command terraform with args [init -upgrade=false]
TestTerraformS3 2020-08-01T04:14:03-05:00 logger.go:66: Initializing the backend...
TestTerraformS3 2020-08-01T04:14:03-05:00 logger.go:66: Initializing provider plugins...
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: The following providers do not have any version constraints in configuration,
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: so the latest version was installed.
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: To prevent automatic upgrades to new major versions that may contain breaking
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: changes, it is recommended to add version = "..." constraints to the
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: corresponding provider blocks in configuration, with the constraint strings
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: suggested below.
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: * provider.aws: version = "~> 3.0"
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: Terraform has been successfully initialized!
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: You may now begin working with Terraform. Try running "terraform plan" to see
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: any changes that are required for your infrastructure. All Terraform commands
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: should now work.
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: If you ever set or change modules or backend configuration for Terraform,
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: rerun this command to reinitialize your working directory. If you forget, other
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: commands will detect it and remind you to do so if necessary.
TestTerraformS3 2020-08-01T04:14:04-05:00 retry.go:72: terraform [get -update]
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: Running command terraform with args [get -update]
TestTerraformS3 2020-08-01T04:14:04-05:00 retry.go:72: terraform [apply -input=false -auto-approve -lock=false]
TestTerraformS3 2020-08-01T04:14:04-05:00 logger.go:66: Running command terraform with args [apply -input=false -auto-approve -lock=false]
TestTerraformS3 2020-08-01T04:14:09-05:00 logger.go:66: aws_s3_bucket.myBucket: Creating...
TestTerraformS3 2020-08-01T04:14:17-05:00 logger.go:66: aws_s3_bucket.myBucket: Provisioning with 'local-exec'...
TestTerraformS3 2020-08-01T04:14:17-05:00 logger.go:66: aws_s3_bucket.myBucket (local-exec): Executing: ["PowerShell" "-Command" "    mkdir out
\r\n    Get-Date > out/test1.txt\r\n    Get-Date > out/test2.txt\r\n"]
TestTerraformS3 2020-08-01T04:14:17-05:00 logger.go:66: aws_s3_bucket.myBucket: Provisioning with 'local-exec'...
TestTerraformS3 2020-08-01T04:14:17-05:00 logger.go:66: aws_s3_bucket.myBucket (local-exec): Executing: ["cmd" "/C" "    aws s3 cp D:\\\\Projects\\\\TerraformFlugel2\\\\Terraform-Flugel\\\\IaC\\\\out\\  s3://flugel-bucket --acl public-read --recursive --exclude \"*\" --include \"*.txt\"\r\n"]
TestTerraformS3 2020-08-01T04:14:19-05:00 logger.go:66: aws_s3_bucket.myBucket: Still creating... [10s elapsed]
TestTerraformS3 2020-08-01T04:14:19-05:00 logger.go:66: aws_s3_bucket.myBucket (local-exec): Completed 90 Bytes/180 Bytes (70 Bytes/s) with 2 file(s) remaining
TestTerraformS3 2020-08-01T04:14:19-05:00 logger.go:66: aws_s3_bucket.myBucket (local-exec): upload: out\test1.txt to s3://flugel-bucket/test1.txt
TestTerraformS3 2020-08-01T04:14:19-05:00 logger.go:66: aws_s3_bucket.myBucket (local-exec): Completed 90 Bytes/180 Bytes (70 Bytes/s) with 1 file(s) remaining
TestTerraformS3 2020-08-01T04:14:19-05:00 logger.go:66: aws_s3_bucket.myBucket (local-exec): Completed 180 Bytes/180 Bytes (123 Bytes/s) with 1 file(s) remaining
TestTerraformS3 2020-08-01T04:14:19-05:00 logger.go:66: aws_s3_bucket.myBucket (local-exec): upload: out\test2.txt to s3://flugel-bucket/test2.txt
TestTerraformS3 2020-08-01T04:14:19-05:00 logger.go:66: aws_s3_bucket.myBucket: Creation complete after 11s [id=flugel-bucket]
TestTerraformS3 2020-08-01T04:14:19-05:00 logger.go:66: Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
TestTerraformS3 2020-08-01T04:14:19-05:00 logger.go:66: Outputs:
TestTerraformS3 2020-08-01T04:14:19-05:00 logger.go:66: BucketID = flugel-bucket
TestTerraformS3 2020-08-01T04:14:19-05:00 retry.go:72: terraform [output -no-color BucketID]
TestTerraformS3 2020-08-01T04:14:19-05:00 logger.go:66: Running command terraform with args [output -no-color BucketID]
TestTerraformS3 2020-08-01T04:14:20-05:00 logger.go:66: flugel-bucket
TestTerraformS3 2020-08-01T04:14:20-05:00 s3.go:88: Read contents from s3://flugel-bucket/test1.txt
TestTerraformS3 2020-08-01T04:14:20-05:00 s3.go:88: Read contents from s3://flugel-bucket/test2.txt
TestTerraformS3 2020-08-01T04:14:20-05:00 retry.go:72: terraform [destroy -auto-approve -input=false -lock=false]
TestTerraformS3 2020-08-01T04:14:20-05:00 logger.go:66: Running command terraform with args [destroy -auto-approve -input=false -lock=false]
TestTerraformS3 2020-08-01T04:14:23-05:00 logger.go:66: aws_s3_bucket.myBucket: Refreshing state... [id=flugel-bucket]
TestTerraformS3 2020-08-01T04:14:31-05:00 logger.go:66: aws_s3_bucket.myBucket: Destroying... [id=flugel-bucket]
TestTerraformS3 2020-08-01T04:14:34-05:00 logger.go:66: aws_s3_bucket.myBucket: Destruction complete after 3s
TestTerraformS3 2020-08-01T04:14:35-05:00 logger.go:66: 
TestTerraformS3 2020-08-01T04:14:35-05:00 logger.go:66: Destroy complete! Resources: 1 destroyed.
PASS
ok      _/D_/Projects/TerraformFlugel2/Terraform-Flugel/test    31.385s
```

