Vagrant.configure("2") do |config|
  config.vm.box = "almalinux/8"
    config.vm.box_check_update = false
    config.vm.provision "shell", inline: <<-SHELL
      echo 123
    SHELL
end
