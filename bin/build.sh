#! /bin/bash

set -euo pipefail

echo
echo "******* Building Docker Images *******"
echo
docker-compose pull
docker-compose build

echo
echo "******* Building Front End *******"
echo
pushd front-end
npm install
popd

echo
echo "******* Done Building *******"
echo
