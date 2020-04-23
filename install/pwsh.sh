#!/bin/bash

LSB_RELEASE=$(lsb_release -rs)

# Install Powershell
apt-get install -y powershell

# Temp fix based on: https://github.com/PowerShell/PowerShell/issues/9746 
sudo apt remove libicu64

# Run tests to determine that the software installed as expected
echo "Testing to make sure that script performed as expected, and basic scenarios work"
if ! command -v pwsh; then
    echo "pwsh was not installed"
    exit 1
fi
if ! pwsh -c 'Write-Host Hello world'; then
    echo "pwsh failed to run"
    exit 1
fi