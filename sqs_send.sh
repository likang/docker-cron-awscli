#!/usr/bin/env bash
source /root/envs.sh

exec >>/var/log/cron.log
exec 2>&1

aws sqs send-message --queue-url $AWS_SQS_QUEUE_URL $@

