data "aws_iam_policy_document" "API_and_lambda_iam_service_role_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]
    effect = "Allow"
    sid    = "APIGatewayCreationLambdaExecRolePolicy"
    principals {
      type        = "Service"
      identifiers = [
            "apigateway.amazonaws.com",
            "lambda.amazonaws.com"
         ]
    }
  }
}


# Data Block having policy details which all provides the permissions
data "aws_iam_policy_document" "api_key_gateway_creation_and_Lambda_Exec_iam_policy_document" {
  statement {
    sid       = "LambdaInvocationForAPIAndLambdaExection"
    actions   = ["lambda:InvokeFunction"]
    effect    = "Allow"
    resources = ["arn:aws:lambda:*"]
  }

  statement {
    sid = "AllowAPIGatewayActions"
    actions = [
      "apigateway:DELETE",
      "apigateway:PATCH",
      "apigateway:POST",
      "apigateway:PUT"
    ]
    effect    = "Allow"
    resources = ["arn:aws:apigateway:*"]
  }

    statement {
    sid = "AllowLogsForGatewayActions"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:PutLogEvents",
      "logs:GetLogEvents",
      "logs:FilterLogEvents"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}

# ADFS-BITeam and ADFS-BITeamContractor IAM Role for having access to API Gateway Creation and Lambda Function Execution
resource "aws_iam_role" "iam_role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.API_and_lambda_iam_service_role_policy_document.json # (not shown)
}

# IAM Policy block with IAM policy document 
resource "aws_iam_policy" "iam_policy" {
  name   = var.policy_name
  path   = "/"
  policy = data.aws_iam_policy_document.api_key_gateway_creation_and_Lambda_Exec_iam_policy_document.json
}

# IAM Role Policy Attachment
resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.iam_policy.arn
  depends_on = [
    aws_iam_role.iam_role
  ]
}