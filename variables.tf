variable "function_name" {
  description = "Name of the Lambda function."
  type        = string
}

variable "role_arn" {
  description = "ARN of the IAM role the function assumes when it executes."
  type        = string
}

variable "handler" {
  description = "Function entrypoint in your code, for example index.handler."
  type        = string
}

variable "runtime" {
  description = "Runtime the function runs on, for example python3.12 or nodejs20.x."
  type        = string
}

variable "filename" {
  description = "Path to a local deployment package (zip). Mutually exclusive with s3_bucket."
  type        = string
  default     = null
}

variable "s3_bucket" {
  description = "S3 bucket containing the deployment package. Mutually exclusive with filename."
  type        = string
  default     = null
}

variable "s3_key" {
  description = "S3 key of the deployment package when s3_bucket is set."
  type        = string
  default     = null
}

variable "memory_size" {
  description = "Amount of memory in megabytes the function has access to."
  type        = number
  default     = 128
}

variable "timeout" {
  description = "Function execution timeout in seconds."
  type        = number
  default     = 3
}

variable "environment_variables" {
  description = "Map of environment variables exposed to the function."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags applied to the function."
  type        = map(string)
  default     = {}
}
