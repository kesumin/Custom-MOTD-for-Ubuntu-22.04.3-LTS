#!/bin/bash
# this script will be running under root

# move current motd to old
echo 'moving old motd files'
if [ ! -d "/etc/update-motd.d.old" ]; then
    mv /etc/update-motd.d /etc/update-motd.d.old
    mkdir /etc/update-motd.d
fi

# create crontab for root
echo 'creating cronjob'
if ! exist /var/spool/cron/crontabs/root (
    touch /var/spool/cron/crontabs/root
) 
fi
# write out current crontab
crontab -l > crontmp
# echo new cron into cron file
CRONCHECK=cat crontmp
if ! grep -q "sh /motd.sh >/dev/null 2>&1" <<< "$CRONCHECK"; then
    echo "*/2 * * * * sh /motd.sh >/dev/null 2>&1" >> crontmp
fi
# install new cron file
crontab crontmp
rm crontmp
echo 'created cronjob successfully'

# download mainfile
echo 'downloading mainfile'
curl -s https://raw.githubusercontent.com/kesumin/Custom-MOTD-for-Ubuntu-22.04.3-LTS/main/motd.sh -o /motd.sh
chmod +x /motd.sh
