#!/bin/bash

TZ=${TZ:-UTC}
export TZ

INTERNAL_IP=$(ip route get 1 | awk '{print $NF;exit}')
export INTERNAL_IP

cd /home/container || exit 1

WQL_LEAF_SQUARE_SIZE=16
WQL_TREE_DEGREE=512
WQL_NUM_LEVELS=2
WQL_ROOTS_PER_TABLE=8
WQL_POSTGRES_CONNECTION_STRING=postgresql://${SQLUSER}:${SQLPASSWORD}@${SQLADDRESS}?port=${SQLPORT}&dbname=${SQLDATABASE}

printf "\033[1m\033[33mcontainer@pterodactyl~ \033[0m%s\n" "$STARTUP"

exec env ${STARTUP}
