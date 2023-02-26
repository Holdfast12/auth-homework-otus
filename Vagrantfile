Vagrant.configure("2") do |config|
  config.vm.box = "almalinux/8"
    config.vm.box_check_update = false
    config.vm.provision "shell", inline: <<-SHELL
      # ставлю докер ACL attr pam_script
      sudo dnf install -y epel-release
      sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
      sudo dnf install -y docker-ce docker-ce-cli containerd.io acl attr pam_script
      sudo systemctl enable docker.service --now
      # создаю пользователя testuser, которому дам права на докер. Также он НЕ будет входить в группу admin и не сможет логиниться через ssh в выходные
      # vagrant и root - смогут
      sudo useradd testuser && echo -e "testuser\ntestuser\n" | sudo passwd testuser
    SHELL
    config.vm.provision :shell, privileged: true, path: "./zadanie1login.sh"
    config.vm.provision :shell, privileged: true, path: "./zadanie2docker.sh"
end
