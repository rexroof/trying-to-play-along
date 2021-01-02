# EKSCTL demo cluster

### aws-iam-authenticator
You will need `aws-iam-authenticator` installed locally to authenticate via kubectl.
the `aws-authenticator.sh` script will download and install this binary into ~/bin/

### eksctl
The `eksctl.sh` script is a helper script to run eksctl inside of a docker image. 
To create a cluster run: 

```
    bash ./eksctl.sh create cluster -f scrumptious-mushroom-demo.yaml
```
