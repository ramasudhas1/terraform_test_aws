variable "sqs_names" { type = "list" }
variable "sqs_visibility_timeout_seconds" { type = "list" }
variable "sqs_message_retention_seconds" { type = "list" }
variable "sqs_fifo_names" { type = "list" }
variable "sqs_fifo_receive_wait_time_seconds" { type = "list" }
variable "project_environment" { type = "string" }
variable "sqs_delay_seconds" { 
  type = "list"
  default = ["90"] }
variable "sqs_max_message_size" { 
  type = "list"
  default = ["2048"] }
variable "sqs_receive_wait_time_seconds" { 
  type = "list"
  default = ["10"] }
  
variable "sqs_fifo_visibility_timeout_seconds" { 
  type = "list"
  default = ["30"] }
variable "sqs_fifo_message_retention_seconds" { 
  type = "list"
  default = ["345600"] }
variable "sqs_fifo_max_message_size" { 
  type = "list"
  default = ["262144"] }
variable "sqs_fifo_delay_seconds" { 
  type = "list"
  default = ["0"] }
