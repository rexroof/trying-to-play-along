# LINODE LKE CLUSTER

This config is written out in a terraform module. 

### Token ENV

you should create an environment variable called `TF_VAR_linode_token` to pass your linode 
API token.   I suggest a .env file that looks like this: 
```
   export TF_VAR_linode_token=<linode token goes here>
```
And then `source .env` before running `terraform`

[your linode API token can be created here](https://cloud.linode.com/profile/tokens)


### creating cluster

After setting up your token in the environment, create the cluster like so:

```
    terraform init
    terraform apply
```

### kubeconfig

the local terraform module will output the kubeconfig as kubecfg.b64. you can decode 
using base64:

```
    base64 --decode kubecfg.b64 > kubeconfig
```

and then use this with kubectl

``` 
    export KUBECONFIG=$PWD/kubeconfig 
    kubectl get pods
```

