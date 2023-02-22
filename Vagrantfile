Vagrant.configure("2") do |config|
  config.vm.box = "almalinux/8"
    config.vm.box_check_update = false
    config.vm.provision "shell", inline: <<-SHELL
      #sudo apt update
      #sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
      #curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
      #sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
      #sudo apt install -y docker-ce
      sudo sed -i s/^SELINUX=.*$/SELINUX=disabled/ /etc/selinux/config
      sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
      sudo dnf install -y epel-release
      sudo dnf install -y docker-ce docker-ce-cli containerd.io screen acl attr iftop man-pages
      sudo systemctl enable docker.service --now
      sudo usermod -aG docker vagrant
      sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      sudo chmod +x /usr/local/bin/docker-compose
      sudo useradd student && echo -e "student\nstudent\n" | sudo passwd student
      # настраиваем ACL права
      #sudo setfacl -m u:student:r file
    SHELL
end
