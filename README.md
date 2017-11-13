# arm-team-foundation-server-sandbox

[![Deploy to Azure](https://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)
[![Vizualize](http://armviz.io/visualizebutton.png)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FJamesCarscadden%2Farm-team-foundation-server-sandbox%2Fmaster%2Fazuredeploy.json)

This template will install a simple server with a default installation of Team Foundation Server 2017 update 3. This is suitable for sandbox usage or experimentation.

Some limitations:

- Reporting is not installed
- SharePoint is not installed
- No build service is configured by default
- https is not enabled, so usernames and passwords will not be secure

This template can take significant time to run, so be patient.

Once installed you can access the TFS installation by pointing a browser to: `http://<public dns name>.<azure location>.cloudapp.azure.com:8080/tfs`

Use the administrator name and password to log in.

## Deploy

1. Using Azure CLI

  Clone the files to your local machine, and then open a terminal at the cloned directory. Make sure you are logged in using azure cli, and that you are in Resource Manager mode. (More on how to do that at the link below)

  ```PowerShell
  azure group create <resource group name> <location>; azure group deployment create -v -f azuredeploy.json <resource group name> <deployment name>
  ```
  [Azure Resource Manager Command Line Documentation](https://azure.microsoft.com/en-us/documentation/articles/xplat-cli-azure-resource-manager/)

1. How to use Azure Powershell

  [Azure Resource Manager on Powershell](https://azure.microsoft.com/en-us/documentation/articles/powershell-azure-resource-manager/)

1. Using Azure Portal

  Click the "Deploy to Azure" button.
