# AKS on Azure

before starting:  create an Azure account and make sure you have an active subscription.

[Azure Console](https://portal.azure.com/#home)


### Authenticate Azure CLI

use `az.sh login` to log into azure cli.
token will be written to local .azure folder.

### create resource group 

this is where your kubernetes resources will live at azure

```
   ./az.sh group create --name aks-demo --location eastus
```

### create cluster

one node cluster, no monitoring, no ssh keys

``` 
    ./az.sh aks create --resource-group aks-demo --name demo-cluster --node-count 1 --no-ssh-key
```

### grab kubectl config

```
    ./az.sh aks get-credentials --resource-group aks-demo --name demo-cluster
```

depending on your docker setup you may need to update permissions on your local .kube folder

### delete resource group to clean up

```
   ./az.sh group delete --name aks-demo --yes --no-wait
```
