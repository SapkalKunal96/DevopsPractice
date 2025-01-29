# DevopsPractice
# This repository is for the devops practice and projects

Pre-requisites for projects

How to install tools?

Download html template (wget https://www.tooplate.com/zip-templates/2088_big_city.zip)


-########## Virtualbox for VM's on Windows ###########-

Please enable the vitualization on your windows before proceeding to the installation of virtualbox.

Download Oracle virtualbox using below link:

https://www.virtualbox.org/wiki/Downloads

-########## Vagrant download ###########-

https://developer.hashicorp.com/vagrant/downloads#windows


-########## Vagrant box ###########-
1. Create a folder
2. Create a Vagrantfile
3. Copy content from the above repository Vagrantfile
4. Run below commands to create ubuntu box in your oracle virtualbox
   vagrant up && vagrant ssh
5. You will be in the ubuntu VM

-########## jenkins installation ###########-

jenkins if the CI tool which is build on the JAVA framework so it needs an java to be installed on virtualbox

1. sudo apt update
2. sudo apt install fontconfig openjdk-17-jre 
3. java -version
4. sudo wget -O /usr/share/keyrings/jenkins-keyring.asc   https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
5. echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]"   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
6. sudo apt update
7. sudo apt-get install jenkins
8. systemctl status jenkins
9. access jenkins using http://localhost:8080/

with above steps you have a jenkins up and running

Install Plugins:
Pipeline: Stage View Plugin
AWS Credentials Plugin


-########## AWS CLI ###########-
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

or refer: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


-########## Install Terraform ###########-
Link: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform

terraform -help

####### Enable tab completion ############
touch ~/.bashrc
terraform -install-autocomplete

#
