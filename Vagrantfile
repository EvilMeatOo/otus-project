# -*- mode: ruby -*- 
# vi: set ft=ruby : vsa
Vagrant.configure(2) do |config| 
 config.vm.box = "generic/centos7" 
 config.vm.box_version = "4.3.4" 
 config.vm.synced_folder ".", "/vagrant", disabled: true
 config.vbguest.auto_update = false
 config.vm.provider "virtualbox" do |v| 
 v.memory = 512
 v.cpus = 2
 end 
 config.vm.define "frontend" do |frontend| 
 frontend.vm.network "public_network", ip: "192.168.0.200", bridge: "enp4s0"
 frontend.vm.network "private_network", ip: "192.168.56.200"
 frontend.vm.hostname = "frontend" 
 frontend.vm.provision "shell", path: "ssh_key.sh" 
 end 
 config.vm.define "backend" do |backend| 
 backend.vm.network "private_network", ip: "192.168.56.201"
 backend.vm.hostname = "backend" 
 backend.vm.provision "shell", path: "ssh_key.sh" 
 backend.vm.provision "shell",
 run: "always",
 inline: "ip route del default via 10.0.2.2 || true"
 backend.vm.provision "shell",
 run: "always",
 inline: "route add default gw 192.168.56.200 eth1"
 end 
 config.vm.define "database" do |database| 
 database.vm.network "private_network", ip: "192.168.56.202"
 database.vm.hostname = "database" 
 database.vm.provision "shell", path: "ssh_key.sh" 
 database.vm.provision "shell",
 run: "always",
 inline: "ip route del default via 10.0.2.2 || true"
 database.vm.provision "shell",
 run: "always",
 inline: "route add default gw 192.168.56.200 eth1"
 end 
 config.vm.define "backup" do |backup| 
 backup.vm.network "private_network", ip: "192.168.56.203"
 backup.vm.hostname = "backup" 
 backup.vm.provision "shell", path: "ssh_key.sh" 
 backup.vm.provision "shell",
 run: "always",
 inline: "ip route del default via 10.0.2.2 || true"
 backup.vm.provision "shell",
 run: "always",
 inline: "route add default gw 192.168.56.200 eth1"
 end 
 config.vm.define "monitoring" do |monitoring| 
 monitoring.vm.network "private_network", ip: "192.168.56.204"
 monitoring.vm.hostname = "monitoring" 
 monitoring.vm.provision "shell", path: "ssh_key.sh" 
 monitoring.vm.provision "shell",
 run: "always",
 inline: "ip route del default via 10.0.2.2 || true"
 monitoring.vm.provision "shell",
 run: "always",
 inline: "route add default gw 192.168.56.200 eth1"
 end 
 config.vm.define "elk" do |elk|
 elk.vm.provider "virtualbox" do |v| 
 v.memory = 2048
 v.cpus = 4
 end 
 elk.vm.network "private_network", ip: "192.168.56.205"
 elk.vm.hostname = "elk" 
 elk.vm.provision "shell", path: "ssh_key.sh" 
 elk.vm.provision "shell",
 run: "always",
 inline: "ip route del default via 10.0.2.2 || true"
 elk.vm.provision "shell",
 run: "always",
 inline: "route add default gw 192.168.56.200 eth1"
 end 
end
