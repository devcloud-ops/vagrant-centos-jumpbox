#!/bin/bash

# initial update and upgrade
sudo yum update -y
sudo yum upgrade -y

# install git
sudo yum update -y
sudo yum install -y git
sudo yum update -y

# install pass
sudo dnf makecache --refresh
sudo dnf -y install pass


# CREATES ISSUES WITH DNF in Fedora
# install python3
sudo yum update -y
sudo yum install gcc openssl-devel bzip2-devel libffi-devel -y
sudo make altinstall
sudo dnf install python3-pip -y

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
sudo dnf clean all
sudo dnf makecache
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf repolist
sudo dnf install terraform -y
sudo yum install -y tflint
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

# install docker: https://docs.docker.com/engine/install/fedora/
sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

sudo dnf -y install dnf-plugins-core

sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# enable docker: https://docs.docker.com/engine/installation/linux/linux-postinstall/#configure-docker-to-start-on-boot
sudo systemctl enable docker
sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker vagrant
sudo yum install -y docker-compose

# install tree
sudo yum install -y tree

# install node js
sudo yum install nodejs -y

# upgrade centos and remove unneeded packages
sudo yum upgrade -y
sudo yum autoremove -y

# add GUI to Fedora: https://docs.fedoraproject.org/en-US/fedora-server/usecase-gui-addon/
sudo dnf group list
sudo dnf groupinstall "Fedora Workstation" -y
sudo systemctl set-default graphical.target
sudo systemctl enable gdm.service
sudo reboot

