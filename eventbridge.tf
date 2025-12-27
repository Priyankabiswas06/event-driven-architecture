resource "aws_cloudwatch_event_bus" "custom_bus" {
  name = "${var.project_name}-bus"
}

resource "aws_cloudwatch_event_rule" "rule" {
  name           = "${var.project_name}-rule"
  event_bus_name = aws_cloudwatch_event_bus.custom_bus.name

  event_pattern = jsonencode({
    source = ["my.app"]
  })
}

resource "aws_cloudwatch_event_target" "target" {
  rule           = aws_cloudwatch_event_rule.rule.name
  event_bus_name = aws_cloudwatch_event_bus.custom_bus.name
  arn            = aws_lambda_function.consumer.arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.consumer.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.rule.arn
}
