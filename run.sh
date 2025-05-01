#!/usr/bin/env bash

set -euo pipefail
ORANGE='\033[0;33m'
END_COLOR='\033[0m'

if [ "$#" -ne 1 ]; then
    # echo "Usage: $0 <Device_portfile>"
    # exit 1
    echo -e "${ORANGE}Warning!${END_COLOR} No argument."
    echo -e "Assuming portfile = DeviceSim0.port"
    echo -e "If you want to change that: "
    echo -e "Usage: $0 <Device_portfile>\n\n\n"
    portfile="DeviceSim0.port"
else
    portfile=$1
fi

ADDRESS=$(<$portfile)
thispath="$(dirname -- "${BASH_SOURCE[0]}")"
thispath="$(cd -- "$thispath" && pwd)"

tmpdir=$(mktemp -d /tmp/ioc_XXXXXXXXXX)
cp $thispath/* $tmpdir/
trap "rm -rf \"$tmpdir\"; cd $thispath" EXIT

ADDRESS="$ADDRESS" envsubst < st.cmd > "$tmpdir/st.cmd"
cd $tmpdir
iocsh "./st.cmd"

