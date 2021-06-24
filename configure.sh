#!/bin/bash

set -xe

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

if [[ $# -lt 5 ]] ; then
    echo "usage:
    $0	<accountname> <server> <port> <user> <passwd> <hub>
    "
    exit 1
fi

ACCOUNTNAME=$1  # for identifying connections
SERVER=$2:$3   # 1194,5555,443,53
USERNAME=$4
PASSWORD=$5
HUB=${6:-vpn}

vpnclient start
sudo /usr/bin/vpncmd /client localhost /cmd niccreate "$ACCOUNTNAME"
sudo /usr/bin/vpncmd /client localhost /cmd accountcreate "$ACCOUNTNAME" /SERVER:"$SERVER" /HUB:"$HUB" /USERNAME:"$USERNAME" /NICNAME:"$ACCOUNTNAME"
sudo /usr/bin/vpncmd /client localhost /cmd accountpasswordset "$ACCOUNTNAME" /PASSWORD:"$PASSWORD" /TYPE:standard
sudo /usr/bin/vpncmd /client localhost /cmd accountdetailset "$ACCOUNTNAME" /MAXTCP:32 /INTERVAL:1 /TTL:0 /HALF:yes /BRIDGE:no /MONITOR:no /NOTRACK:yes /NOQOS:yes
sudo /usr/bin/vpncmd /client localhost /cmd accountstartupset "$ACCOUNTNAME"
sudo /usr/bin/vpncmd /client localhost /cmd accountconnect "$ACCOUNTNAME"
vpnclient stop

set +xe
