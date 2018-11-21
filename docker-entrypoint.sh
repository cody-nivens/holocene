#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

#echo "Waiting for MariaDB to start..."
#while ! nc -z mariadb 3306; do sleep 0.1; done
#echo "MariaDB is up"

#echo "Waiting for Redis to start..."
#while ! nc -z redis 6379; do sleep 0.1; done
#echo "Redis is up - execuring command"

exec bundle exec "$@"

