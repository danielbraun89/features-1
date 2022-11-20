#!/usr/bin/env bash
#-------------------------------------------------------------------------------------------------------------
# This code was generated by the DevContainers Feature Cookiecutter 
# Docs: https://github.com/devcontainers-contrib/cookiecutter-devcontainers-feature
#-------------------------------------------------------------------------------------------------------------

set -ex


# npm version for typescript
TYPESCRIPT=${VERSION:-"latest"}


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
    echo "Installing node and npm..."

    if [ ! -f "${HOME}/.bashrc" ] || [ ! -s "${HOME}/.bashrc" ] ; then
        cp  /etc/skel/.bashrc "${HOME}/.bashrc"
    fi
    if  [ ! -f "${HOME}/.profile" ] || [ ! -s "${HOME}/.profile" ] ; then
        cp  /etc/skel/.profile "${HOME}/.profile"
    fi
    echo "hioio0"

    check_packages curl
    curl -fsSL https://raw.githubusercontent.com/devcontainers/features/main/src/node/install.sh | $SHELL
    echo "hioio1"
    ls /usr/local/share/nvm/versions/node 


    export NVM_DIR=/usr/local/share/nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
    echo "hioio2"
    ls /usr/local/share/nvm/versions/node 


fi

if [ "$TYPESCRIPT" != "none" ]; then
    if [ "$TYPESCRIPT" =  "latest" ]; then
        util_command="typescript"
    else
        util_command="typescript@$TYPESCRIPT"
    fi
    npm install -g --omit=dev ${util_command}
fi

echo "hii"
ls /usr/local/share/nvm/versions/node 
which node
which npm

# Clean up
rm -rf /var/lib/apt/lists/*


echo "Done!"