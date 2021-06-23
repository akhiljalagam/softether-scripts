# Softether VPN Client Setup and Configuration

### Why I made this?
_Softether vpnclient for linux don't have UI like windows client for configuring vpn accounts which takes couple of commands so I created some scripts for easy setup and oneshot configuration_

## Install Dependencies
Ubuntu/Debian
```
apt -y install build-essentials
apt -y install readline-dev ncurses-dev openssl-dev
apt -y install gcc make libtool
```
Redhat/CentOS
```
yum -y groupinstall "Development Tools"
yum -y install readline-devel ncurses-devel openssl-devel
yum -y install gcc make libtool
```
## Install & Configure vpnclient
```bash
# clone this repo
sudo git clone https://github.com/akhilin/softether-scripts.git /opt/softether-scripts
# compile and install vpnclient with systemd service file
sudo /opt/softether-scripts/install.sh
# configure any number of vpn client accounts
sudo /opt/softether-scripts/configure.sh <server> <port> <user> <passwd> <accountname> <hub>
```
## Systemd Unit
```
systemctl enable/start/status/stop softether-vpnclient
```
## dhclient
```
dhclient -v vpn_<accountname>
```
