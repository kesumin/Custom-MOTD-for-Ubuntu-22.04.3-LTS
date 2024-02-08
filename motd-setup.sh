#!/bin/bash
# this script will be running under root

# move current motd to old
mv /etc/update-motd.d /etc/update-motd.d.old
mkdir /etc/update-motd.d

# echo 'sh /motd.sh && cat /etc/motd' >> /etc/update-motd.d/00-custom.sh
# chmod +x /etc/update-motd.d/00-custom.sh

# write out current crontab
crontab -l > mycron
# echo new cron into cron file
echo "*/2 * * * * sh /motd.sh >/dev/null 2>&1" >> mycron
# install new cron file
crontab mycron
rm mycron

# download mainfile
curl -s https://raw.githubusercontent.com/kesumin/Custom-MOTD-for-Ubuntu-22.04.3-LTS/main/motd.sh -o /motd.sh
chmod +x /motd.sh
