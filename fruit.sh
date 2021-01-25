#!/bin/bash
# 
# Variables:
# FRUIT_ACCOUNT: bitwarden account email
# FRUIT_CONFIG: ssh configuration file, if it doesn't exits, ~/.ssh/config will be used

EXECUTOR=ssh

function help {
    cat <<  EOM
Manager of ssh connections by password

Usege:
   fruit [fruit-options] TARGET [ssh-options]

Options:
   -p    specific executor like ssh, sftp, etc
   -f    sftp executor
   -h    this help
EOM
    exit 0
}

if [[ $# -le 0 ]]; then
    help
fi

while (($#)); do 
    if echo "$1" | grep -v '^-' > /dev/null; then
        TARGET=$1
        shift 1
        break
    fi
    case $(echo "$1" | cut -f 2 -d '-') in
        p) EXECUTOR=$2; shift 2;;
        f) EXECUTOR=sftp; shift 1;;
        h) help;;
    esac
done

if [ -z "$TARGET" ]; then
    exit 1
fi

if [ -n "$FRUIT_CONFIG" ]; then
    CONFIG_FILE="-F $FRUIT_CONFIG"
fi

HERE=$(dirname $([ -L $0 ] || echo $0 && readlink -f $0))
PASSWORD=$($HERE/pamis/${FRUIT_PASSMANAGER}.sh $TARGET)

case $? in
    1) echo "Unknown error in password manager" >&2; exit 1;;
    2) echo "Error getting password" >&2; exit 1;;
    5) echo "Password manager login error" >&2; exit 1;;
esac

sshpass -p "$PASSWORD" $EXECUTOR "$@" $CONFIG_FILE $TARGET
