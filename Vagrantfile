Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "private_network", ip: "192.168.13.37"
  config.vm.network "forwarded_port", guest: 80, host: 8090

  # Install docker
  config.vm.provision :docker

  # Install docker-compose
  config.vm.provision "shell", name: "Install of Docker Compose", inline: <<-EOC
    test -e /usr/local/bin/docker-compose || \\
    curl -sSL https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` \\
      | sudo tee /usr/local/bin/docker-compose > /dev/null
    sudo chmod +x /usr/local/bin/docker-compose
    test -e /etc/bash_completion.d/docker-compose || \\
    curl -sSL https://raw.githubusercontent.com/docker/compose/$(docker-compose --version | awk 'NR==1{print $NF}')/contrib/completion/bash/docker-compose \\
      | sudo tee /etc/bash_completion.d/docker-compose > /dev/null
  EOC

  # Install dependencies
  config.vm.provision "shell", name: "Install dependencies", inline: <<-EOC
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
    sudo apt-get install nodejs -y
    cd /vagrant
    npm install --ignore-scripts
  EOC

  # Compose grow chat
  config.vm.provision "shell", name: "Setup Grow Chat", run: "always", path: "provision.sh"
end
