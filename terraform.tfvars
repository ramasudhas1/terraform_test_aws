sqs_names = ["DL-Dev-SQS01", "itrams-dl-dev-datalogger-response-01", "itrams-dl-prod-dlq-01", "itrams-dl-prod-dlt-01", "itrams-dl-prod-queue-01"]
sqs_visibility_timeout_seconds = ["300", "30", "30", "1200", "60"]
sqs_message_retention_seconds  = ["172800", "345600", "345600", "345600", "345600"]
sqs_fifo_names = ["itrams-dl-dev-plotly-request-01.fifo", "itrams-dl-dev-plotly-request-02.fifo", "itrams-dl-dev-plotly-response-01.fifo", "itrams-dl-prod-plotly-request-01.fifo", "itrams-dl-prod-plotly-response-01.fifo", "trams-dl-dev-plotly-response-02.fifo"]
sqs_fifo_receive_wait_time_seconds = ["5", "0", "0", "0", "0", "0"]
project_environment = "Development"
