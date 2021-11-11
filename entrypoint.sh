#!/bin/bash

TZ=${TZ:-UTC}
export TZ

INTERNAL_IP=$(ip route get 1 | awk '{print $NF;exit}')
export INTERNAL_IP

cd /home/container || exit 1

env WQL_LEAF_SQUARE_SIZE=16
env WQL_TREE_DEGREE=512
env WQL_NUM_LEVELS=2
env WQL_ROOTS_PER_TABLE=8
env WQL_POSTGRES_CONNECTION_STRING=postgresql://${SQLUSER}:${SQLPASSWORD}@${SQLADDRESS}?port=${SQLPORT}&dbname=${SQLDATABASE}

PARSED=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | eval echo "$(cat -)")

printf "\033[1m\033[33mcontainer@pterodactyl~ \033[0m%s\n" "$PARSED"

exec env ${PARSED}
