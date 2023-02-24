Vagrant.configure("2") do |config|
  config.vm.box = "almalinux/8"
    config.vm.box_check_update = false
    config.vm.provision "shell", inline: <<-SHELL
      sudo sed -i s/^SELINUX=.*$/SELINUX=disabled/ /etc/selinux/config
      sudo dnf install -y epel-release
      sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
      sudo dnf install -y docker-ce docker-ce-cli containerd.io acl attr pam_script
      sudo systemctl enable docker.service --now
      sudo usermod -aG docker vagrant
      sudo useradd testuser && echo -e "testuser\ntestuser\n" | sudo passwd testuser
      #
      sudo setfacl -m u:testuser:rw /var/run/docker.sock
      sudo cp /vagrant/00-docker-restart.rules /etc/polkit-1/rules.d/00-docker-restart.rules
      #
      sudo groupadd admin
      sudo usermod -aG admin root
      sudo usermod -aG admin vagrant
    SHELL
end
