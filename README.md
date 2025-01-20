# DevopsPractice
# This repository is for the devops practice and projects

Pre-requisites for projects
How to install tools?


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

