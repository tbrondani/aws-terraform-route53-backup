resource "aws_iam_role" "lambda_backup" {
  name = "${var.lambda_function_name}+iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
  ] })

  tags = {
    tag-key = "tag-value"
  }
}

# See also the following AWS managed policy: AWSLambdaBasicExecutionRole

resource "aws_iam_policy" "lambda_logging" {
  name        = var.iam_role_name
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid" : "Allow lambda to log itself"
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "${aws_cloudwatch_log_group.lambda_logging.arn}}",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_backup.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}

