# Background

* The purpose of this taks is to create script (powershell) which will install azuredevops build agent with all it's pre-requisites.

# Limitaions

* The script will run in an "air-gapped" (no internet access) environemnt, which means the script can't download files from the internet.  
  
# Guidelines:`
* This is a public repo, *dont store credentials!*
* You need to create a folder with all the prerequsites, the script will install from that folder.

* Make sure you download full installation files (not installers which will downlad additional resources from the internet)

* The script needs to install two environemtns:
    a. .NET 4.5.2
    b. .NET 4.7

* There are two docker files which you can use for general assitance

# Required Componetns:
* .NET 4.5.2 / .NET 4.7  
* visualcpp-build-tools  
* msbuild  
* asp.net 45 (if installing .NET 4.5.2)  
* python 3  
* git  
* ndode 10
* docker

# Script Parameters:

* Path to parameters.json
* AZP_TOKEN

# parameters.json:

* Below is an example of parameters.json file:
```json
{
    ".NET_VERSION": "string", // 4.5.2 or 4.7  
    "RESOURCES_FOLDER": "string", // path to the folder containing all the resources
    "AZP_POOL": "string", // The pool in which to create the build agent
    "AZP_AGENT_NAME": "string", // The name of the agent
    "AZP_URL": "string" // Url to azuredevops server
}
```





