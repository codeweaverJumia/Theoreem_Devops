#S3 Bucket
resource "aws_s3_bucket" "lambda_storage" {
  bucket = "tf-${var.name}-storage"
}

data "archive_file" "local_zipped_lambda" {
  type        = "zip"
  source_dir  = "${path.module}/lambda"
  output_path = "${path.module}/lambda.zip"
}

resource "aws_s3_bucket_object" "zipped_lambda" {
  bucket = aws_s3_bucket.lambda_storage.bucket
  key    = "lambda.zip"
  source = data.archive_file.local_zipped_lambda.output_path
}

# Upload Json Data to S3 Bucket
resource "aws_s3_bucket_object" "JsonData" {
  bucket = aws_s3_bucket.lambda_storage.bucket
  key    = "Data.json"
  source = "Data.json"
}

#Lambda function 
resource "aws_lambda_function" "service" {
  function_name = "tf-${var.name}"
  s3_bucket     = aws_s3_bucket.lambda_storage.bucket
  s3_key        = aws_s3_bucket_object.zipped_lambda.key

  handler     = "src/lambda.handler"
  runtime     = "nodejs14.x"
  timeout     = var.timeout
  memory_size = var.memory_size
  role        = aws_iam_role.service.arn
  environment {
    variables = {
      bucketName = "${aws_s3_bucket.lambda_storage.bucket}"
      keyName = "${aws_s3_bucket_object.JsonData.key}"

    }
  }
}

#IAM Policies
resource "aws_iam_policy" "service" {
  name = "tf-${var.name}"
  path = "/"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "service" {
  name = "tf-${var.name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "service" {
  name = "tf-${var.name}"
  role = aws_iam_role.service.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "service" {
  role       = aws_iam_role.service.name
  policy_arn = aws_iam_policy.service.arn
}