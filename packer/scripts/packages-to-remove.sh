PKGS_TO_UNINSTALL="
nano
cupsys*
ntp
aspell*
bind9-host
fdutils
hplip
mutt
ppp
pppoe
pppoeconf
pppoeconf
iamerican
ibritish
ispell
tcsh
w3m
smbclient
foomatic-filters
"
DEBIAN_FRONTEND=noninteractive apt-get purge -y ${PKGS_TO_UNINSTALL}
