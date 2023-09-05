#!/bin/bash

# initial update and upgrade
sudo yum update -y
sudo yum upgrade -y

# install git
sudo yum update -y
sudo yum install -y git
sudo yum update -y

# install pass
# sudo dnf makecache --refresh
# sudo dnf -y install pass
# sudo yum -y install pass


# install python3
sudo yum update -y
sudo yum install gcc openssl-devel bzip2-devel libffi-devel -y
# sudo curl -O https://www.python.org/ftp/python/3.9.2/Python-3.9.2.tgz
# sudo tar -xzf Python-3.9.2.tgz
# cd Python-3.9.2/
# sudo ./configure --enable-optimizations
# sudo make altinstall
# sudo yum update -y
# sudo rm /usr/bin/python3
# sudo ln /usr/local/bin/python3.9 /usr/bin/python3
# python3 -m pip install --upgrade pip

# install ansible
sudo dnf install python3-pip -y
sudo yum update -y
sudo yum install -y epel-release
sudo yum install -y ansible
sudo yum update -y

# install build essential tools
sudo yum update -y
sudo yum install -y build-essential
sudo yum update -y

# install vagrant
sudo yum update -y
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install vagrant
sudo yum update -y

# install terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
sudo yum update -y

# install dnf
sudo yum update -y
sudo yum install -y dnf
sudo yum update -y

# install azure cli on centos7: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=dnf
echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo
sudo dnf install -y azure-cli
sudo az upgrade -y --all --only-show-errors
sudo yum update -y

# install aws cli
sudo yum update -y
sudo pip3 install awscli
pip3 install awscli --upgrade --user
pip3 install awscli --upgrade --user
sudo yum update -y

# install cfn-lint
pip3 install cfn-lint

# install yamllint
sudo dnf install -y yamllint

# install ansible lint
sudo python3 -m pip install --upgrade pip
pip install ansible-lint

# install docker: https://docs.docker.com/engine/installation/linux/centos/
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum makecache fast
sudo yum -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# enable docker: https://docs.docker.com/engine/installation/linux/linux-postinstall/#configure-docker-to-start-on-boot
sudo systemctl enable docker
sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker vagrant
sudo yum install -y docker-compose

# install tree
sudo yum install -y tree

# bash autocompletion
sudo yum install bash-completion -y

# install node js
sudo yum install nodejs -y
sudo dnf install npm -y
sudo npm install -g npm@9.6.4 -y
sudo npm install -g express -y
sudo npm install -g nodemon -y
sudo npm install -g newman -y

# install yarn
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
sudo dnf install yarn -y

# upgrade centos and remove unneeded packages
sudo yum upgrade -y
sudo yum autoremove -y




