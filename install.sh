#!/bin/bash
set -xe
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
git clone https://github.com/SoftEtherVPN/SoftEtherVPN_Stable.git /opt/SoftEtherVPN_Stable
cd /opt/SoftEtherVPN_Stable
./configure
make
make install
set +xe
