package test

import (
	"testing"
	//imports needed for the functionality we used.
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/stretchr/testify/assert"
	//"github.com/gruntwork-io/terratest/modules/logger"

)

// TestTerraformS3 Test function.... to run in terminal--> "go test -run TerraformS3"
func TestTerraformS3(t *testing.T) {
	t.Parallel()

	// Name of S3 Bucket we can distinguish (created in terraform)
	expectedName := "flugel-bucket"

	terraformOptions := &terraform.Options{
		TerraformDir: "../IaC/",
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// comparing the actual name of the bucket with the expected name.
	BucketID := terraform.Output(t, terraformOptions, "BucketID")
	assert.Equal(t, expectedName, BucketID)

	//validating if the TXT files exist and have content.
	file1 := aws.GetS3ObjectContents(t, "us-east-1", expectedName, "test1.txt")
	assert.NotEmpty(t,file1)
	file2 := aws.GetS3ObjectContents(t, "us-east-1", expectedName, "test2.txt")
	assert.NotEmpty(t,file2)
	
	//logger.Log(t, file1)

}
