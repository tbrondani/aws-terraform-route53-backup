resource "aws_cloudwatch_event_rule" "event_rule_backup" {
  name                = "my-awesome-rule-for-day-to-day-execution"
  description         = "run it everyday"
  schedule_expression = "rate(1 day)"
}

resource "aws_cloudwatch_event_target" "event_target_backup" {
  arn  = aws_lambda_function.lambda_backup.arn
  rule = aws_cloudwatch_event_rule.event_rule_backup.name
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_rw_fallout_retry_step_deletion_lambda" {
  function_name = aws_lambda_function.lambda_backup.arn
  source_arn    = aws_cloudwatch_event_rule.event_rule_backup.arn
  statement_id  = "AllowExecutionFromCloudWatch"

  action    = "lambda:InvokeFunction"
  principal = "events.amazonaws.com"

}
