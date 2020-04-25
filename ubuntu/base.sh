#!/bin/bash
################################################################################
##  File:  base.sh
##  Desc:  Installs official Microsoft package repos for the distribution
################################################################################

apt-get update
apt-get install apt-utils

# https://packages.ubuntu.com/bionic/lsb-core
# Linux Standard Base core support package
apt-get install lsb-core

echo "Install sudo"
apt-get install -y --no-install-recommends sudo

echo "Install wget"
apt-get install -y --no-install-recommends wget

# General utilities follows.
echo "Install curl"
apt-get install -y --no-install-recommends curl

echo "Install unzip"
apt-get install -y --no-install-recommends unzip

echo "Install zip"
apt-get install -y --no-install-recommends zip

LSB_RELEASE=$(lsb_release -rs)

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

# Use apt-fast for parallel downloads
apt-get install aria2
add-apt-repository -y ppa:apt-fast/stable
apt-get update
apt-get -y install apt-fast


echo "Install vim"
apt-get install -y --no-install-recommends vim