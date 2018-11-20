#!/bin/bash

set -euo pipefail


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"


echo Building libudt.a
pushd "$SCRIPT_DIR"/udt/src
make -j`nproc`
popd


echo Building libudpwrap.a
pushd "$SCRIPT_DIR"
dub build --compiler="$DC"
popd


echo Building sendfile
pushd "$SCRIPT_DIR"/sendfile
dub build --compiler="$DC"
popd


echo Building recvfile
pushd "$SCRIPT_DIR"/recvfile
dub build --compiler="$DC"
popd


echo Running tests
pushd "$SCRIPT_DIR"/test
dub run --compiler="$DC"
popd
