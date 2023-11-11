mkdir -p ~root/.ssh
echo "ssh-rsa some public key"  > ~root/.ssh/authorized_keys
sudo systemctl restart sshd
