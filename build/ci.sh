#!/bin/bash

set -euo pipefail


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
DC="${DC:-dmd}"

"$DC" -of"$SCRIPT_DIR"/build "$SCRIPT_DIR"/build.d
"$SCRIPT_DIR"/build
