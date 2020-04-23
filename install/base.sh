#!/bin/bash
################################################################################
##  File:  base.sh
##  Desc:  Installs official Microsoft package repos for the distribution
################################################################################

# https://packages.ubuntu.com/bionic/lsb-core
# Linux Standard Base core support package
sudo apt-get install lsb-core

LSB_RELEASE=$(lsb_release -rs)

sudo apt-get install wget

# https://docs.microsoft.com/en-us/windows-server/administration/linux-package-repository-for-microsoft-software
# Install Microsoft repository
wget https://packages.microsoft.com/config/ubuntu/$LSB_RELEASE/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Install Microsoft GPG public key
curl -L https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
apt-get update

sh apt.sh

## Misc
apt-get install unzip