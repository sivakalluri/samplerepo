# IAM Role ARN 
output "iam_role_arn" {
  value = aws_iam_role.iam_role.arn
}

# IAM Role Policy
output "iam_policy_arn" {
  value = aws_iam_policy.iam_policy.arn
}