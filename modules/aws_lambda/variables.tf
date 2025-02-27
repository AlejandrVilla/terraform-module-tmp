# ./modules/aws-lambda/variables.tf

variable "region" {
  description = "AWS region"
  type        = string
}

variable "lambda_name" {
  description = "Name for the lambda function"
  type        = string
}

variable "handler" {
  description = "Handle for the lambda function"
  type        = string
}

variable "python_runtime" {
  description = "Version of python for lambda function"
  type        = string
}

variable "s3_bucket" {
  description = "Bucket s3 with the source code"
  type        = string
}

variable "s3_key" {
  description = "Key for s3 Bucket"
  type        = string
}
