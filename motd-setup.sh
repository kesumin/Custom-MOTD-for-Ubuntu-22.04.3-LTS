#!/bin/bash
# this script will be running under root

# move current motd to old
if [ ! -d "/etc/update-motd.d.old" ]; then
    echo 'moving old motd files'
    mv /etc/update-motd.d /etc/update-motd.d.old
    mkdir /etc/update-motd.d
fi

# update-motd.d method
if ! test -e "/etc/update-motd.d/99-server-info"; then
    touch /etc/update-motd.d/99-server-info
    curl -s https://raw.githubusercontent.com/kesumin/Custom-MOTD-for-Ubuntu-22.04.3-LTS/main/99-server-info -o /etc/update-motd.d/99-server-info
    chmod +x /motd.sh
    echo 'installed mainfile'
fi