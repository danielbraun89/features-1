#!/bin/bash

set -x

ls /usr/local/share/nvm/versions/node
which node

which npm
source dev-container-features-test-lib
check "node --version" node --version
check "npm --version" npm --version

set -xe
check "tsc --version" tsc --version

reportResults