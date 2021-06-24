# Softether VPN Clients Setup and Configuration with systemd service

### Why I made this?
_Softether vpnclient for linux don't have UI like windows client for configuring vpn accounts which takes couple of commands so I created some scripts for easy setup and oneshot configuration_

## Dependencies
### Debian based
```
apt -y install build-essentials
apt -y install readline-dev ncurses-dev openssl-dev
apt -y install gcc make libtool
```
### Fedora based
```
yum -y groupinstall "Development Tools"
yum -y install readline-devel ncurses-devel openssl-devel
yum -y install gcc make libtool
```
## Install & Configure vpnclient
```bash
# login to root using `sudo su`
# clone this repo
git clone https://github.com/akhilin/softether-scripts.git /opt/softether-scripts
# compile and install vpnclient
/opt/softether-scripts/install.sh
# configure any number of vpn client accounts
/opt/softether-scripts/configure.sh <accountname> <server> <port> <user> <passwd> <hub>
```
## Systemd Unit
modify systemd service file to your needs.
and run these to install
### for dhclient
```
cp vpnclient.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable vpnclient
systemctl start vpnclient
systemctl status vpnclient
```

### for static ip assignment
```
cp vpnclient-static.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable vpnclient-static
systemctl start vpnclient-static
systemctl status vpnclient-static
```

## LAN networking fix
Issue `cat /proc/sys/net/ipv4/ip_forward` to check whether ip forward is enabled in your system.  
If you get `0`, Navigate to /etc/sysctl.conf file and uncomment `net.ipv4.ip_forward=1` line. Open a terminal and issue command `sysctl -p`  
Then check whether you get “1”  

