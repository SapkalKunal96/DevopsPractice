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