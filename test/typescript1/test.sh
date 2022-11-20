#!/bin/bash

set -ex

ls /usr/local/share/nvm/versions/node/v18.12.1/bin/

source dev-container-features-test-lib
check "node --version" node --version
check "npm --version" npm --version

check "tsc --version" tsc --version

reportResults