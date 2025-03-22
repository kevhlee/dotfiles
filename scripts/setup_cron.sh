#!/bin/sh

CRON_DIR=$HOME/dotfiles/scripts/cron
CRON_TMP=/tmp/cronjobs

echo "" > $CRON_TMP

crontab $CRON_TMP

echo "Current Cron jobs"
echo "-----------------"
crontab -l
