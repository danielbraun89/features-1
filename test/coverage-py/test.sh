#!/bin/bash

set -e

source dev-container-features-test-lib

check "coverage --version" coverage --version

reportResults