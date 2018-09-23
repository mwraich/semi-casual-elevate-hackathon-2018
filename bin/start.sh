#! /bin/bash

set -euo pipefail


echo
echo "******* Checking/Installing forego *******"
echo
command -v foo >/dev/null 2>&1 || brew install forego

forego start
