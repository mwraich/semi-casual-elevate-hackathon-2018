#! /bin/bash

set -euo pipefail

echo
echo "******* Starting Front End *******"
echo
pushd front-end
PORT=3000 npm start
