# terraform-aws-lambda

Terraform module that manages an [AWS Lambda](https://aws.amazon.com/lambda/)
function. It creates a single function from either a local zip or an S3
deployment package and exposes the invoke ARN so event sources can be wired to
it.

## Usage

```hcl
module "lambda" {
  source = "github.com/moveeeax/terraform-aws-lambda"

  function_name = "api-handler"
  role_arn      = aws_iam_role.lambda.arn
  handler       = "index.handler"
  runtime       = "python3.12"
  filename      = "package.zip"

  environment_variables = {
    STAGE = "production"
  }

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| aws       | >= 5.0   |

## Inputs

| Name                    | Description                                              | Type          | Default   | Required |
|-------------------------|----------------------------------------------------------|---------------|-----------|:--------:|
| `function_name`         | Name of the Lambda function.                            | `string`      | n/a       |   yes    |
| `role_arn`              | ARN of the execution IAM role.                          | `string`      | n/a       |   yes    |
| `handler`               | Function entrypoint in your code.                       | `string`      | n/a       |   yes    |
| `runtime`               | Runtime the function runs on.                           | `string`      | n/a       |   yes    |
| `filename`              | Path to a local deployment package (zip).               | `string`      | `null`    |    no    |
| `s3_bucket`             | S3 bucket containing the deployment package.            | `string`      | `null`    |    no    |
| `s3_key`                | S3 key of the deployment package.                       | `string`      | `null`    |    no    |
| `memory_size`           | Amount of memory in megabytes.                          | `number`      | `128`     |    no    |
| `timeout`               | Execution timeout in seconds.                           | `number`      | `3`       |    no    |
| `environment_variables` | Map of environment variables.                           | `map(string)` | `{}`      |    no    |
| `tags`                  | Tags applied to the function.                           | `map(string)` | `{}`      |    no    |

## Outputs

| Name            | Description                                          |
|-----------------|------------------------------------------------------|
| `id`            | Name of the Lambda function.                         |
| `arn`           | ARN of the Lambda function.                          |
| `invoke_arn`    | ARN used to invoke the function.                     |
| `version`       | Latest published version of the function.            |
| `qualified_arn` | ARN of the function including the version.           |

## License

[MIT](LICENSE)
