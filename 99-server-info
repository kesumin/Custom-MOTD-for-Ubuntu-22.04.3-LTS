#!/bin/sh
#. /etc/os-release
PRETTY_NAME=`awk -F= '$1=="PRETTY_NAME" { print $2 ;}' /etc/os-release | tr -d '"'`
VERSION_ID=`awk -F= '$1=="VERSION_ID" { print $2 ;}' /etc/os-release`
UPTIME_DAYS=$(expr `cat /proc/uptime | cut -d '.' -f1` % 31556926 / 86400)
UPTIME_HOURS=$(expr `cat /proc/uptime | cut -d '.' -f1` % 31556926 % 86400 / 3600)
UPTIME_MINUTES=$(expr `cat /proc/uptime | cut -d '.' -f1` % 31556926 % 86400 % 3600 / 60)
cat > /etc/motd << EOF
%+++++++++++++++++++++++++++++++ SERVER INFO ++++++++++++++++++++++++++++++++%
%                                                                            %
        Name: `hostname`
        Uptime: $UPTIME_DAYS days, $UPTIME_HOURS hours, $UPTIME_MINUTES minutes
        CPU: `cat /proc/cpuinfo | grep 'model name' | head  -1 | cut -d':' -f2`
        Memory: `free -m | head -n 2 | tail -n 1 | awk {'print  $2'}`M
        Swap: `free -m | tail -n 1 | awk {'print $2'}`M Disk: `df -h / | awk  '{ a = $2 } END { print a }'`

        Last Updated: `date $T`

        Kernel: `uname -r`
        Distro: $PRETTY_NAME
        Version $VERSION_ID

        CPU Load: `cat /proc/loadavg | awk '{print $1 ", " $2 ", " $3}'`
        Free Memory: `free -m | head -n 2 | tail -n 1 | awk {'print $4'}`M
        Free Swap: `free -m | tail -n 1 | awk {'print $4'}`M
        Free Disk: `df -h / | awk '{ a =  $2 } END { print a }'`

        enp0s4 Address: `ifconfig enp0s4 | grep -i inet | head -1 | awk '{print $2}'`
%                                                                            %
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
EOF
