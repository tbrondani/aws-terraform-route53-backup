######################################
########### DEFAULT TFVARS ###########

#global variables
region = "us-east-1"

#s3
bucket_name   = "my-awesome-bucket"
force_destroy = true

# lambda
lambda_function_name  = "lifesaver-route53-backuper"
log_retention_in_days = 30

# iam
iam_role_name = "lifesaver-route53-role"

#Tagging
tag_billing     = "cloud"
tag_environment = "dns-account"
tag_owner       = "cloud-infrastructure"