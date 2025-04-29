#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <ip:port>"
    exit 1
fi

ADDRESS="$1"
thispath="$(dirname -- "${BASH_SOURCE[0]}")"
thispath="$(cd -- "$thispath" && pwd)"

tmpdir=$(mktemp -d /tmp/ioc_XXXXXXXXXX)
cp $thispath/* $tmpdir/
trap "rm -rf \"$tmpdir\"; cd $thispath" EXIT

ADDRESS="$ADDRESS" envsubst < st.cmd > "$tmpdir/st.cmd"
cd $tmpdir
iocsh "./st.cmd"

