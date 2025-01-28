# How to create an service principle using command line?

<!-- az login -->

## How to to it automatically if we are using CI ?
# Create an common SP for azure and then login using below command
<!-- az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID -->

<!-- az account list
az account set --subscription="20000000-0000-0000-0000-000000000000"
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/20000000-0000-0000-0000-000000000000" -->

# here we are login with our new created SP
<!-- az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID -->




# How to pass env variables to terraform
# sh
<!-- $ export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
$ export ARM_CLIENT_CERTIFICATE_PATH="/path/to/my/client/certificate.pfx"
$ export ARM_CLIENT_CERTIFICATE_PASSWORD="Pa55w0rd123"
$ export ARM_TENANT_ID="10000000-0000-0000-0000-000000000000"
$ export ARM_SUBSCRIPTION_ID="20000000-0000-0000-0000-000000000000" -->

# Upload website files to $web container

<!-- az storage blob upload-batch --pattern "container_size_sample_file_*.txt" --source . --destination $container --account-key $accountKey --account-name $storageAccount -->

# here is another script from azure document
## https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blobs-static-site-github-actions?tabs=userlevel

<!-- - name: Upload to blob storage
      uses: azure/CLI@v1
      with:
        inlineScript: |
            az storage blob upload-batch --account-name <STORAGE_ACCOUNT_NAME>  --auth-mode key -d '$web' -s .
    - name: Purge CDN endpoint
      uses: azure/CLI@v1
      with:
        inlineScript: |
           az cdn endpoint purge --content-paths  "/*" --profile-name "CDN_PROFILE_NAME" --name "CDN_ENDPOINT" --resource-group "RESOURCE_GROUP" -->