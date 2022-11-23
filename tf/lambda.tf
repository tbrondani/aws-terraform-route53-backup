resource "aws_lambda_function" "lambda_backup" {
  function_name = var.lambda_function_name

  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.example,
  ]
}

resource "aws_cloudwatch_log_group" "lambda_logging" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = var.log_retention_in_days
}

# See also the following AWS managed policy: AWSLambdaBasicExecutionRole
resource "aws_iam_policy" "lambda_logging" {
  name        = var.iam_role_name 
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid" : "Allow lambda to log itself"
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "${aws_cloudwatch_log_group.arn}}",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}

#Normally I would dedicate a tf file for each group respectively, iam.tf for iam resources only and such, but in this case, since it's a simple deployment I'm using only one file :)