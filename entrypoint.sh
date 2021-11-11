#!/bin/bash

TZ=${TZ:-UTC}
export TZ

INTERNAL_IP=$(ip route get 1 | awk '{print $NF;exit}')
export INTERNAL_IP

cd /home/container || exit 1

WQL_POSTGRES_CONNECTION_STRING = postgresql://${SQLUSER}:${SQLPASSWORD}@${SQLADDRESS}?port=${SQLPORT}&dbname=${SQLDATABASE}

printf "\033[1m\033[33mcontainer@pterodactyl~ \033[0m%s\n" "$STARTUP"

/etc/init.d/postgresql start

exec env ${STARTUP}
