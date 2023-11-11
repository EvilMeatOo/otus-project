#!/bin/bash


source_file="/var/lib/grafana/grafana.db"
backup_folder="/root/backup/grafana"
backup_name="backup_grafana_$(date +\%Y\%m\%d).tar.gz"
remote_server="root@192.168.56.203:/root/backup/grafana"


tar -czf "$backup_folder/$backup_name" -P "$source_file"


rsync -az --remove-source-files -e "ssh -p2200 -o UserKnownHostsFile=/root/.ssh/known_hosts -o LogLevel=quiet -o StrictHostKeyChecking=no" "$backup_folder/$backup_name" "$remote_server"