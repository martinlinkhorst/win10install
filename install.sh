#!/bin/bash

# Create user
adduser marlon

# Add to windows terminal profile settings: 
# "commandline": "wsl.exe -d Ubuntu-18.04 -u marlon"
# "startingDirectory": "//wsl$/Ubuntu-18.04/home/marlon/"
# Add to /etc/sudoers
# under:
# root    ALL=(ALL:ALL) ALL
# marlon  ALL=(ALL:ALL) ALL

# Install common bins
apt-get update \
      && apt-get install -y apt-transport-https \
      && apt-get install -y gnupg2 \
      && apt-get install jq -y

# Install helm
wget https://get.helm.sh/helm-v3.0.0-linux-amd64.tar.gz
tar -zxvf helm-v3.0.0-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm

# Install terraform
wget --quiet https://releases.hashicorp.com/terraform/0.12.13/terraform_0.12.13_linux_amd64.zip \
  && unzip terraform_0.12.13_linux_amd64.zip \
  && mv terraform /usr/bin

# Install kubectl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get install -y kubectl

# Install .net core
wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get update
apt-get install dotnet-sdk-3.1 -y

# Install az
curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get update
apt-get install code -y

# Install zsh and tmux
apt-get install zsh tmux -y
apt-get install powerline fonts-powerline -y
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh)
echo "alias k=kubectl" >> ~/.zshrc
echo "bindkey -v" >> ~/.zshrc
echo "source <(kubectl completion zsh)" >> ~/.zshrc

