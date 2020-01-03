# Install Chocolatey
# Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# Set-ExecutionPolicy Bypass -Scope Process -Force

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

choco install googlechrome -y
choco install vscode -y
choco install kubernetes-cli -y
choco install kubernetes-helm -y
choco install python3 -y
choco install visualstudio2019community -y	
choco install microsoft-windows-terminal -y
choco install dotnetcore-sdk -y
choco install git -y
choco install azure-cli -y
choco install wsl -y
choco install nodejs -y
choco install nvm -y
choco install slack -y
choco install keybase -y
choco install yarn -y
choco install androidstudio -y
choco install keepass -y
choco install sql-server-management-studio -y
choco install ServiceBusExplorer -y
choco install RoboMongo -y
choco install docker-desktop -y
choco install officeproplus2013 -y
# reboot
choco install wsl-ubuntu-1804 -y

