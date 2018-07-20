#!/bin/bash
set -m

### Start mongo server
echo 'Initializate Mongo Server'
mongod --bind_ip_all --auth &

### Check user admin is set
if [ ! -f /data/db/.auth_set ]; then
  echo 'Prepare authentication set'
  /create-user.sh
else
  echo 'Skip authentication'
fi

fg
