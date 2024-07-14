resource "aws_iam_role" "order" {
  name               = "${var.project}_role_order"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "order" {
  type        = "zip"
  source_file = "${path.module}/../lambda_order/lambda_function.py"
  output_path = "${path.module}/${var.project}_lambda_function_order_payload.zip"
}

resource "aws_lambda_function" "order" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "${var.project}_lambda_function_order_payload.zip"
  function_name = "${var.project}-order"
  role          = aws_iam_role.order.arn
  handler       = "lambda_function.lambda_handler"

  source_code_hash = data.archive_file.order.output_base64sha256

  runtime = "python3.12"

  environment {
    variables = {
      project = "${var.project}"
    }
  }
}