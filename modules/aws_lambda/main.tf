# ./modules/aws-lambda/main.tf

provider "aws" {
  region = var.region
}

resource "aws_lambda_function" "lambda_function" {
  function_name = var.lambda_name
  role          = aws_iam_role.lambda_exec.arn
  handler       = var.handler
  runtime       = var.python_runtime
  s3_bucket     = var.s3_bucket
  s3_key        = var.s3_key

  environment {
    variables = {
      REGION      = var.region
      LAMBDA_NAME = var.lambda_name
    }
  }

  tags = {
    Name  = var.lambda_name
    Owner = "Villa - Terraform"
  }
}

resource "aws_iam_role" "lambda_exec" {
  name = "villa_lambda_exec_role"

  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "lambda.amazonaws.com"
        },
        "Effect": "Allow"
      }
    ]
  }
  EOF
}

resource "aws_iam_role_policy_attachment" "lambda_basic" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role = aws_iam_role.lambda_exec.name
}
