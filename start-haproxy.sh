#!/bin/sh
# Note: I've written this using sh so it works in the busybox container too

# USE the trap if you need to also do manual cleanup after the service is stopped,
#     or need to start multiple services in the one container
trap "echo TRAPed signal" HUP INT QUIT KILL TERM

# start service in background here
service rsyslog start
service haproxy start

echo "[hit CTRL-C to exit] or run 'docker stop <container>'"

tail -f /var/log/haproxy.log

# stop service and clean up here
echo "stopping haproxy"
service haproxy stop

echo "exited $0"

