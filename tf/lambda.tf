resource "aws_lambda_function" "lambda_backup" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_backup.arn
  //handler = ""
  runtime  = "python3.6"
  filename = files(lambda / script.py)


  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.lambda_logging,
  ]
}

resource "aws_cloudwatch_log_group" "lambda_logging" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = var.log_retention_in_days
}