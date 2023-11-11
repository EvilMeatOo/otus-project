#!/bin/bash

backup_folder="/root/backup/mysql"
backup_name="backup_wp_mysql_$(date +\%Y\%m\%d).tar.gz"
remote_server="root@192.168.56.203:/root/backup/mysql"
sql_file="/root/backup/backup_wp_mysql.sql"

mysqldump --all-databases  > "$sql_file"


tar -czf "$backup_folder/$backup_name" -P "$sql_file"


rsync -az --remove-source-files -e "ssh -p2200 -o UserKnownHostsFile=/root/.ssh/known_hosts -o LogLevel=quiet -o StrictHostKeyChecking=no" "$backup_folder/$backup_name" "$remote_server"