# Description

A custom motd for Ubuntu 22.04.3 LTS.
Forked from [
arvati/alpine_motd_generator.md](https://gist.github.com/arvati/7d698d4472c8b2a6a9995b05f168c15a) on GitHub Gist.

## Installation
do `curl -s https://raw.githubusercontent.com/kesumin/Custom-MOTD-for-Ubuntu-22.04.3-LTS/main/motd-start -o /motd-start && sudo bash /motd-start`
Remember to delete /motd-start

## Usage

You may change your network device in /motd.sh on line 26.

To see avaliable network devices, run the following command:

`ip link show | awk '{print $2}' | awk 'NR % 2 == 1' | awk '{sub(/:$/,""); print}'`
