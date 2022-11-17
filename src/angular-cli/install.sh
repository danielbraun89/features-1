#!/usr/bin/env bash
#-------------------------------------------------------------------------------------------------------------
# This code was generated by the DevContainers Feature Cookiecutter 
# Docs: https://github.com/devcontainers-contrib/cookiecutter-devcontainers-feature
#-------------------------------------------------------------------------------------------------------------

set -e


# npm version for @angular/cli
ANGULAR_CLI=${VERSION:-"latest"}


# Clean up
rm -rf /var/lib/apt/lists/*

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            echo "Running apt-get update..."
            apt-get update -y
        fi
        apt-get -y install --no-install-recommends "$@"
    fi
}





 
# install node+npm if does not exists
if ! type npm > /dev/null 2>&1; then
    echo "Installing npde and npm..."
    check_packages curl
    
    curl -fsSL https://raw.githubusercontent.com/devcontainers/features/main/src/node/install.sh > install.sh
    source install.sh
    rm install.sh
fi

if [ "$ANGULAR_CLI" != "none" ]; then
    if [ "$ANGULAR_CLI" =  "latest" ]; then
        util_command="@angular/cli"
    else
        util_command="@angular/cli@$ANGULAR_CLI"
    fi
    npm install -g --omit=dev ${util_command}
fi




# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"