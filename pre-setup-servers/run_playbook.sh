ansible-playbook -i $1 playbook.yaml --force-handlers --skip-tags "service, service_monitoring, restore"
[ $? -ne 0 ] && { echo 'Playbook exit with error code, next processing will be skipped'; exit 3 ; }

echo "Changing ansible_port and ansible_ssh_pass in '$1' file"
sed -i $1 -e "s/ansible_port=22$/ansible_port=2200/" -e "s/ansible_ssh_pass=.*/ansible_ssh_pass=/"

ansible-playbook -i $1 playbook.yaml -t "service"

echo "Changing ansible_port and ansible_ssh_pass in '$1' file"
sed -i $1 -e "s/ansible_port=2200/ansible_port=22/" -e "s/ansible_ssh_pass=.*/ansible_ssh_pass=/"
