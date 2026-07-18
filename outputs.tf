output "id" {
  description = "Name of the Lambda function."
  value       = aws_lambda_function.this.id
}

output "arn" {
  description = "ARN of the Lambda function."
  value       = aws_lambda_function.this.arn
}

output "invoke_arn" {
  description = "ARN used to invoke the function from API Gateway or other services."
  value       = aws_lambda_function.this.invoke_arn
}

output "version" {
  description = "Latest published version of the function."
  value       = aws_lambda_function.this.version
}

output "qualified_arn" {
  description = "ARN of the function including the version."
  value       = aws_lambda_function.this.qualified_arn
}
