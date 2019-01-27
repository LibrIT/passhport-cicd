# Update the server
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
apt-get autoremove -y
apt-get clean
