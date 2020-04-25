#!/bin/bash

# Install LTS Node.js and related build tools
curl -sL https://git.io/n-install | bash -s -- -ny -
~/n/bin/n lts

npm install -g npm

# Install Yarn repository and key
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update

# Install yarn
apt-get install -y --no-install-recommends yarn