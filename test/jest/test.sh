#!/bin/bash

set -e

source dev-container-features-test-lib

check "jest --version" jest --version

reportResults