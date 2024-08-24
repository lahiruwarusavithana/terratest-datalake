package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/azure"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraform_AzureDatalakeTest(t *testing.T) {

	t.Parallel()
	ARM_SUBSCRIPTION_ID := "xxxxxxxxxxxxxxxxxxxxxx"

	uniquePostfix := random.UniqueId()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../",
		Vars: map[string]interface{}{
			"postfix": uniquePostfix,
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	//Get the expected value from Terraform variables
	storageAccountName := terraform.Output(t, terraformOptions, "storage_account_name")
	resourceGroupName := terraform.Output(t, terraformOptions, "resource_group_name")
	datalakeContainerName := terraform.Output(t, terraformOptions, "datalake_name")

	//Get the actual value from azure infrastructure
	actualstorageAccountName := azure.ResourceGroupExists(t, resourceGroupName, ARM_SUBSCRIPTION_ID)
	storageAccountExists := azure.StorageAccountExists(t, storageAccountName, resourceGroupName, ARM_SUBSCRIPTION_ID)
	datalakeContainerExists := azure.StorageBlobContainerExists(t, datalakeContainerName, storageAccountName, resourceGroupName, ARM_SUBSCRIPTION_ID)
	
	//Checking the existance of units
	assert.True(t, actualstorageAccountName, "Resource group does not exist")
	assert.True(t, storageAccountExists, "storage account does not exist")
	assert.True(t, datalakeContainerExists, "Azure datalake does not exist")

}
