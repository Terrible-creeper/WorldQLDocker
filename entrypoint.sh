#!/bin/bash

TZ=${TZ:-UTC}
export TZ

INTERNAL_IP=$(ip route get 1 | awk '{print $NF;exit}')
export INTERNAL_IP

cd /home/container || exit 1

export WQL_LEAF_SQUARE_SIZE=16
export WQL_TREE_DEGREE=512
export WQL_NUM_LEVELS=2
export WQL_ROOTS_PER_TABLE=8
export WQL_POSTGRES_CONNECTION_STRING=postgresql://${SQLUSER}:${SQLPASSWORD}@${SQLADDRESS}?port=${SQLPORT}&dbname=${SQLDATABASE}

env | grep WQL

PARSED=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | eval echo "$(cat -)")

printf "\033[1m\033[33mcontainer@pterodactyl~ \033[0m%s\n" "$PARSED"

exec env ${PARSED}
