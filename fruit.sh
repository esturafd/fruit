#!/bin/bash
# 
# Variables:
# FRUIT_ACCOUNT: bitwarden account email
# FRUIT_CONFIG: ssh configuration file, if it doesn't exits, ~/.ssh/config will be used


if [ -z "$FRUIT_CONFIG" ]; then
    CONFIG_FILE="-F $FRUIT_CONFIG"
fi

export BW_SESSION=$(bw login $FRUIT_ACCOUNT --raw)
PASSWORD=$(bw get password ssh:$1)
bw logout
sshpass -p "$PASSWORD" ssh $CONFIG_FILE "$@"
