#!/bin/bash

export BW_SESSION=$(bw login $FRUIT_ACCOUNT --raw) || exit 5
bw get password ssh:$1 || {
    bw logout > /dev/null
    exit 2
}
bw logout > /dev/null