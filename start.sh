# export all environment variables to use in cron
env | sed 's/^\(.*\)$/export \1/g' > /root/envs.sh
chmod +x /root/envs.sh

# Run the command on container startup
touch /var/log/cron.log && cron && tail -f /var/log/cron.log

