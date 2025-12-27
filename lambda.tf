resource "aws_lambda_function" "producer" {
  function_name = "${var.project_name}-producer"
  filename      = "../lambdas/producer.zip"
  handler       = "app.handler"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_role.arn
}

resource "aws_lambda_function" "consumer" {
  function_name = "${var.project_name}-consumer"
  filename      = "../lambdas/consumer.zip"
  handler       = "app.handler"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_role.arn
}
