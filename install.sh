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
cp softether-vpnclient.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable softether-vpnclient
systemctl start softether-vpnclient
systemctl status softether-vpnclient
ip a
set +x
