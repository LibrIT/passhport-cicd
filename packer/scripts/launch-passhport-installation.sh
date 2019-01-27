#! /bin/bash
wget --no-check-certificate https://raw.githubusercontent.com/librit/passhport/master/tools/passhport-install-script-debian-8-9.sh
chmod +x passhport-install-script-debian-8-9.sh
./passhport-install-script-debian-8-9.sh -s
rm passhport-install-script-debian-8-9.sh
