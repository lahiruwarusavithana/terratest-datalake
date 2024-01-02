
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "lsw-rg-terra"
}

variable "location" {
  description = "Name of the Cloud region"
  type        = string
  default     = "eastus"
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = "lswstroge"
}

variable "postfix" {
  description = "A postfix string to centrally mitigate resource name collisions"
  type        = string
  default     = "resource"
}

