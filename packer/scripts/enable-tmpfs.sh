#! /bin/bash
sudo cp /usr/share/systemd/tmp.mount /etc/systemd/system/tmp.mount
sudo mkdir /etc/systemd/system/tmp.mount.d
sudo touch /etc/systemd/system/tmp.mount.d/options.conf

# We want tmpfs to be half memory size
MEMSIZE=`cat /proc/meminfo | grep MemTotal | awk '{print $2}'`
TARGET_TMPFS_SIZE_KB=`expr ${MEMSIZE} / 2`
TARGET_TMPFS_SIZE_BYTES=`expr ${TARGET_TMPFS_SIZE_KB} \* 1000`
if [ ${TARGET_TMPFS_SIZE_BYTES} -lt 2000000000 ]
then
	TARGET_TMPFS_SIZE_BYTES=2000000000
fi
sudo cat <<EOF >/etc/systemd/system/tmp.mount.d/options.conf
[Mount]
Options=mode=1777,noexec,nodev,size=${TARGET_TMPFS_SIZE_BYTES}
EOF

sudo systemctl enable tmp.mount
sudo systemctl start tmp.mount
