#!/bin/bash


source_server="root@192.168.56.203"
destination_folder="/var/lib/grafana"
rsync_folder="/tmp"

latest_archive=$(ssh root@192.168.56.203 -p2200 -o UserKnownHostsFile=/root/.ssh/known_hosts -o LogLevel=quiet -o StrictHostKeyChecking=no 'ls -t /root/backup/grafana/*.tar.gz | head -1')

if [ -z "$latest_archive" ]; then
    echo "There are no archives available for recovery."
    exit 1
fi

systemctl stop grafana-server.service

rsync -az -e "ssh -p2200 -o UserKnownHostsFile=/root/.ssh/known_hosts -o LogLevel=quiet -o StrictHostKeyChecking=no" "$source_server:$latest_archive" "$rsync_folder"


tar -xzf "$rsync_folder/$(basename "$latest_archive")" -P "$destination_folder"

systemctl start grafana-server.service

rm "$rsync_folder/$(basename "$latest_archive")"