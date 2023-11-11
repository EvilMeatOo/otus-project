#!/bin/bash


source_server="root@192.168.56.203"
destination_folder="/var/www/html/wp"
rsync_folder="/tmp"

latest_archive=$(ssh root@192.168.56.203 -p2200 -o UserKnownHostsFile=/root/.ssh/known_hosts -o LogLevel=quiet -o StrictHostKeyChecking=no 'ls -t /root/backup/wp/*.tar.gz | head -1')

if [ -z "$latest_archive" ]; then
    echo "There are no archives available for recovery."
    exit 1
fi


rsync -az -e "ssh -p2200" "$source_server:$latest_archive" "$rsync_folder"


tar -xzf "$rsync_folder/$(basename "$latest_archive")" -P "$destination_folder"


rm "$rsync_folder/$(basename "$latest_archive")"