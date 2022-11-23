###GLOBAL VARIABLES

variable "region" {
  description = "aws region you want to deploy the solution"
  type = string
  default = "us-east-1"
}

### S3 

variable "bucket_name" {
  description = "Name of the bucket for the backup application"
  type = string
  default = "my-bucket-backup-test-amazing-solutions-2023-remaster-ultra-editorscut"
}

variable "force_destroy"{
  description = "Only use this if you are TESTING"
  type = bool
  default = false
}


### LAMBDA

variable "lambda_function_name" {
  description = "Name of the function you want to deploy"
  type = string
  default = "super-mega-backup-lambdator"
}

variable "log_retention_in_days" {
  description = "The time you want to keep the logs for lambda executions"
  type = number
  default = 
}

#IAM
variable "iam_role_name" {
  description = "Name of the role"
  type = string
  default = "lambda-logging-role"
}


##Tagging

variable "tag_environment" {}
variable "tag_billing" {}
variable "tag_owner" {}
variable "tag_region" {