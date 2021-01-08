# Digital Ocean Kubernetes

### log into digital ocean

first you will need to set up a digital ocean account and generate an access token.  Instructions here:
[creating an access token](https://www.digitalocean.com/docs/apis-clis/api/create-personal-access-token/)

add token using this command:  (or edit to provide in environment)

```
    ./doctl.sh auth init
```

### create cluster

Create single node cluster with 2cpu/4gb

```
    ./doctl.sh k cluster create demo-cluster --size=s-2vcpu-4gb --count=1
```


### delete cluster

```
    ./doctl.sh k cluster delete demo-cluster
```

### config hack

you will need to edit your resulting kube config to update the path to your local doctl command.
the local doctl.sh script will work, with the correct path:

example:

```
    command: /home/rex/github/rexroof/trying-to-play-along/digitalocean/doctl.sh
```


