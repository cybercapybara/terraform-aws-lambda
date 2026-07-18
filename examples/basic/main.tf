terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

variable "region" {
  description = "AWS region to deploy the example function into."
  type        = string
  default     = "us-east-1"
}

variable "package_path" {
  description = "Path to a local Lambda deployment package (zip)."
  type        = string
  default     = "package.zip"
}

provider "aws" {
  region = var.region
}

data "aws_iam_policy_document" "assume" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda" {
  name               = "example-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.assume.json
}

module "lambda" {
  source = "../.."

  function_name = "example-fn"
  role_arn      = aws_iam_role.lambda.arn
  handler       = "index.handler"
  runtime       = "python3.12"
  filename      = var.package_path

  environment_variables = {
    STAGE = "sandbox"
  }

  tags = {
    Environment = "sandbox"
    ManagedBy   = "terraform"
  }
}

output "function_arn" {
  value = module.lambda.arn
}
