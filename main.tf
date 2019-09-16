provider "aws" {

region = "ap-south-1"
}


resource "aws_sqs_queue" "terraform_queue" {
  count       = "${length(var.sqs_names)}"
  name        = "${element(var.sqs_names, count.index)}"
  visibility_timeout_seconds = "${element(var.sqs_visibility_timeout_seconds, count.index)}"
  message_retention_seconds  = "${element(var.sqs_message_retention_seconds, count.index)}"
  delay_seconds              = "${element(var.sqs_delay_seconds, count.index)}"
  max_message_size       = "${element(var.sqs_max_message_size, count.index)}"
  receive_wait_time_seconds  = "${element(var.sqs_receive_wait_time_seconds, count.index)}"

  tags = {
    Environment = "${var.project_environment}"
  }
  lifecycle {
    ignore_changes = ["message_retention_seconds"] # keep this so I can show the bug
#     prevent_destroy = true
#     create_before_destroy = true
  }
}

resource "aws_sqs_queue_policy" "standard_policy" {
  count       = "${length(var.sqs_names)}"
  queue_url = "${element(aws_sqs_queue.terraform_queue.*.id, count.index)}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:*",
      "Resource": "${element(aws_sqs_queue.terraform_queue.*.arn, count.index)}"
    }
  ]
}
POLICY
}



resource "aws_sqs_queue" "terraform_queue_fifo" {
  count       = "${length(var.sqs_fifo_names)}"
  name        = "${element(var.sqs_fifo_names, count.index)}"
  fifo_queue                  = true
  content_based_deduplication = true
  visibility_timeout_seconds = "${element(var.sqs_fifo_visibility_timeout_seconds, count.index)}"
  message_retention_seconds  = "${element(var.sqs_fifo_message_retention_seconds, count.index)}"
  max_message_size           = "${element(var.sqs_fifo_max_message_size, count.index)}"
  delay_seconds              = "${element(var.sqs_fifo_delay_seconds, count.index)}"
  receive_wait_time_seconds  = "${element(var.sqs_fifo_receive_wait_time_seconds, count.index)}"
  tags = {
    Environment = "${var.project_environment}"
  }
}

resource "aws_sqs_queue_policy" "fifo_policy" {
  count       = "${length(var.sqs_fifo_names)}"
  queue_url = "${element(aws_sqs_queue.terraform_queue_fifo.*.id, count.index)}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:*",
      "Resource": "${element(aws_sqs_queue.terraform_queue_fifo.*.arn, count.index)}"
    }
  ]
}
POLICY
}

