FROM python

# inspired from https://devblog.digimondo.io/how-to-use-environment-variables-in-docker-with-cron-50b20baab430

RUN echo "Asia/Shanghai" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

RUN pip install awscli --upgrade

RUN apt-get update \
 && apt-get install --no-install-recommends -y \
 cron

COPY start.sh sqs_send.sh /bin/
RUN chmod +x /bin/start.sh /bin/sqs_send.sh

# Add crontab file in the cron directory
ONBUILD ADD crontab.txt /etc/cron.d/thecron

# Give execution rights on the cron job
ONBUILD RUN chmod 0644 /etc/cron.d/thecron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# start script
CMD /bin/bash /bin/start.sh

