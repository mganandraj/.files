#!/bin/bash

sudo curl -o /usr/local/bin/nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe && alias nuget="mono /usr/local/bin/nuget.exe"