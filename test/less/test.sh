#!/bin/bash

set -e

source dev-container-features-test-lib

check "less --version" less --version

reportResults