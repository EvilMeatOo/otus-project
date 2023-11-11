#!/bin/bash


source_folder="/var/www/html/wp"
backup_folder="/root/backup/wp"
backup_name="backup_wp_$(date +\%Y\%m\%d).tar.gz"
remote_server="root@192.168.56.203:/root/backup/wp"


tar -czf "$backup_folder/$backup_name" -P "$source_folder"


rsync -az --remove-source-files -e "ssh -p2200 -o UserKnownHostsFile=/root/.ssh/known_hosts -o LogLevel=quiet -o StrictHostKeyChecking=no" "$backup_folder/$backup_name" "$remote_server"