#!/bin/sh

USER_ID=${USER_ID:-1001}
useradd --shell /bin/bash -u $USER_ID -o -c "" -m joe
export HOME=/home/joe
exec /usr/local/bin/gosu joe "$@"
