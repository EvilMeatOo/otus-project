echo "Changing ansible_port and ansible_ssh_pass in '$1' file"
sed -i $1 -e "s/ansible_port=22$/ansible_port=2200/" -e "s/ansible_ssh_pass=.*/ansible_ssh_pass=/"

ansible-playbook -i $1 playbook.yaml -t "restore"

echo "Changing ansible_port and ansible_ssh_pass in '$1' file"
sed -i $1 -e "s/ansible_port=2200/ansible_port=22/" -e "s/ansible_ssh_pass=.*/ansible_ssh_pass=/"
