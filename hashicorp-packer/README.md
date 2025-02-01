  # Linux Commands
- Download packer for linux from packer.io
- clone this github repo
- cd repoName
- edit packer-vars.json file and add your access key and secret access key, vpc-id and subnetid
- Check for the ami (make sure you are selecting ubuntu and us-east-1 region ami id)
- ensure auto assign public ip is enable for the subnet
- Run below commands
  sudo packer validate --var-file packer-vars.json packer.json
  sudo packer inspect --var-file packer-vars.json packer.json
  sudo packer build --var-file packer-vars.json packer.json

  Note: Make sure to use sudo while running commands else you will see below error message,

  kunalS@cloudEnthusiastic.netlify.app/hashicorp-packer:$ packer validate --var-file packer-vars.json packer.json 
  <!-- Error: Failed to initialize build "amazon-ebs"

  The builder amazon-ebs is unknown by Packer, and is likely part of a plugin that
  is not installed.
  You may find the needed plugin along with installation instructions documented
  on the Packer integrations page.

  https://developer.hashicorp.com/packer/integrations?filter=amazon -->

  To check load balancing
  echo "<body><div class="container"><h1>$(hostname -f)</h1></body>" >> /var/www/html/index.nginx-debian.html