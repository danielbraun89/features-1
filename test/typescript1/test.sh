#!/bin/bash

set -x

ls /usr/local/share/nvm/versions/node

ls /usr/local/share/nvm/versions/node/19.1.0/bin
which node

which npm
which tsc

source dev-container-features-test-lib
check "node --version" node --version
check "npm --version" npm --version

set -xe
check "tsc --version" tsc --version

reportResults