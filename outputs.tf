output "producer_lambda" {
  value = aws_lambda_function.producer.function_name
}

output "event_bus_name" {
  value = aws_cloudwatch_event_bus.custom_bus.name
}
