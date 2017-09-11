#!/usr/bin/env bash
source /root/envs.sh

exec >>/var/log/cron.log
exec 2>&1

if [ $# -eq 1 ]; then
  aws sqs send-message --queue-url $AWS_SQS_QUEUE_URL --message-body "$@"
else
  aws sqs send-message --queue-url $AWS_SQS_QUEUE_URL "$@"
fi

