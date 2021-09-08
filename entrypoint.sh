#!/usr/bin/env bash

cmd=/usr/local/bin/jsonnet
if [ -n "$1" ] && ( command -v "$1" &>/dev/null ); then
  cmd="$1"; shift; # override entry
fi

exec $cmd "$@"
