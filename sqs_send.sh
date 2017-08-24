#!/usr/bin/env bash
exec >>/var/log/cron.log
exec 2>&1


source /root/envs.sh
echo $AWS_SQS_QUEUE_URL $@
#aws sqs send-message --queue-url $AWS_SQS_QUEUE_URL $@

