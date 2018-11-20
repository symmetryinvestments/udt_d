#!/bin/bash


set -euo pipefail


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

cd "$SCRIPT_DIR"


[[ -e dpp ]] || git clone https://github.com/atilaneves/dpp.git
pushd dpp
git checkout v0.0.6
dub build
popd

export PATH=$PATH:$SCRIPT_DIR/dpp/bin
echo "PATH: $PATH"

ls $SCRIPT_DIR
