# Region in which Role need to be created
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# Name of the IAM Role to be created
variable "role_name" {
  description = "Name of the IAM Role"
  type        = string
  default     = "ADFS-BITeam_and_ADFS-BITeamContractor_iam_role"
}

# Name of the Policy which will be created
variable "policy_name" {
  description = "Name of the IAM Policy to be created"
  type        = string
  default     = "api_key_gateway_creation_and_Lambda_Execution"
}

