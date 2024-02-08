#!/bin/bash
mv /etc/update-motd.d /etc/update-motd.d.old
mkdir /etc/update-motd.d
echo 'sh /motd.sh && cat /etc/motd' >> /etc/update-motd.d/00-custom.sh
curl -s https://raw.githubusercontent.com/kesumin/Custom-MOTD-for-Ubuntu-22.04.3-LTS/main/motd.sh -o /motd.sh
