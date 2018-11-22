#!/bin/bash

# Be sure to set PATH so that the d++ binary can be found

set -euo pipefail


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
REPO_DIR="$SCRIPT_DIR"/..


if which d++ &> /dev/null; then
    echo 'Translating .dpp files'
    d++ --include-path="$REPO_DIR"/udt/src --preprocess-only --keep-d-files "$REPO_DIR"/source/udtwrap.dpp
else
    echo 'Could not find d++, not translating'
fi
