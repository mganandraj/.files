
#!/bin/bash

# LSB_CODENAME=$(lsb_release -cs)
LSB_CODENAME=18.04

# Test to see if the software in question is already installed, if not install it
# wget "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF" -O out && sudo apt-key add out && rm out

# apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
# echo "deb https://download.mono-project.com/repo/ubuntu stable-$LSB_CODENAME main" | tee /etc/apt/sources.list.d/mono-official-stable.list
# apt-get update
# apt-get install -y --no-install-recommends apt-transport-https mono-complete

# From https://www.mono-project.com/download/stable/#download-lin
apt install gnupg ca-certificates
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list
apt update

apt install mono-devel

# Run tests to determine that the software installed as expected
echo "Testing to make sure that script performed as expected, and basic scenarios work"
if ! command -v mono; then
    echo "mono was not installed"
    exit 1
fi