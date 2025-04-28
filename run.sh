#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <ip:port>"
    exit 1
fi

ADDRESS="$1"

tmpfile=$(mktemp /tmp/st_cmd_XXXXXX)
trap "rm -f \"$tmpfile\"" EXIT

ADDRESS="$ADDRESS" envsubst < st.cmd > "$tmpfile"
iocsh "$tmpfile"

