# terratest-datalake

 I will explain how to test the Terraform configuration related to the Azure environment with terratest. When doing test cases for Terraform, it is important to write test cases with terratest developed internally at Gruntwork to maintain the Infrastructure as Code (IAC). The terratest test case is written by Go Lang. Therefore, We have used Go lang to implement these test cases.

 Here we will be planning to create the following components sequentially.

1. Creating a Resource Group
2. Creating a vnet
3. Creating a subnet
4. Creating a storage account using subnet ID
5. Creating a datalake using the storage account
6. Writing test case for the terraform configuration using terratest and Go

# prerequisites :

* An Azure account
* Terraform
* Azure CLI
* GO lang (requires version >=1.21. 1 for terratest)

When you name your test case, in the context of Terratest or any Go testing, having a file name ending with “_test.go” is a convention that helps organize and execute tests in a straightforward manner using Go’s testing infrastructure.

After creating your test file, the following command can be used to test the test file.

## To configure dependencies in the testing directory

cd test<br />
go mod init "<MODULE_NAME>"<br />
go mod tidy<br />

These commands will create go.mod and go.sum file in the current test directory.
Ex :
* go mod init terratest
* go mod tidy
* go test -v -timeout 30m (To run the tests)

## Happy Terraform !!! 