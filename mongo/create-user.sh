#!/bin/bash
set -e

### Check variables external
if [ -z ${MONGO_ADMIN_PASSWORD+x} ]; then
  MONGO_ADMIN_PASSWORD=123
fi

if [ -z ${MONGO_DB+x} ]; then
  MONGO_DB=developer
fi

if [ -z ${MONGO_USER+x} ]; then
  MONGO_USER=developer
fi

if [ -z ${MONGO_PASSWORD+x} ]; then
  MONGO_PASSWORD=123
fi

### Wait for mongo deamon is ready and set user admin
STARTUP=1

while [[ STARTUP -ne 0 ]]; do
    echo "Set configuration on mongo auth, please wait..."
    sleep 5
    mongo --eval "version" > /dev/null 2>&1
    STARTUP=$?
done

mongo admin --eval "db.createUser({ user: 'admin', pwd: '$MONGO_ADMIN_PASSWORD', roles: ['root'] })"

echo "Admin user created!"
sleep 2

mongo admin -u admin -p $MONGO_ADMIN_PASSWORD << EOF
use $MONGO_DB
db.createUser({ user: '$MONGO_USER', pwd: '$MONGO_PASSWORD', roles: [{ role: 'dbOwner', db: '$MONGO_DB' }, { role: 'read', db: 'local' }]})
EOF

echo "$MONGO_USER user created!"
sleep 2

touch /data/db/.auth_set

echo "Configuration on mongo server is ready!!!"
