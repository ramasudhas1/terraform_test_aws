output "sqs_queue_ids" {
  description = "List of SQS Queue ARNs"
  value       = "${concat(
    aws_sqs_queue.terraform_queue.*.id
  )}"
}

output "sqs_queue_fifo_ids" {
  description = "List of SQS FIFO Queue ARNs"
  value       = "${concat(
    aws_sqs_queue.terraform_queue_fifo.*.id
  )}"
}
