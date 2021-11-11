#!/bin/bash
cd /home/container
WQL_POSTGRES_CONNECTION_STRING = postgresql://${SQLUSER}:${SQLPASSWORD}@${SQLADDRESS}?port=${SQLPORT}&dbname=${SQLDATABASE}

/etc/init.d/postgresql start

${STARTUP}
