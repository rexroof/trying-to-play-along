# Google GKE.

before you start we assume you have a google cloud account created with billing activated.
You can set that up here:  [Google Cloud Console](https://console.cloud.google.com)

### login and create project. 

The Auth login step will require you to open a url into your web browser, 
grant access to the gcloud CLI, and then paste a token back into the terminal.

```
   ./gcloud.sh auth login
```

after you are authenticated, set your default compute zone and create your project. 

note: you will need to create your own unique project name

```
   export GKEPROJECT=$(date +rex-gkedemo-%Y%m%d)
   ./gcloud.sh config   set compute/zone us-west1-a
   ./gcloud.sh projects create ${GKEPROJECT}
   ./gcloud.sh config   set project ${GKEPROJECT}
```

after this, you will need to activate billing on this project.  
do that by going to the cloud console under billing:
[Google Cloud Console Billing](https://console.cloud.google.com/billing/projects)

This can also be done with the gcloud cli:

```
    # list your available billing accounts
    ./gcloud.sh alpha billing accounts list
    # associate it with your project using the billing account id
    ./gcloud.sh alpha billing projects link ${GKEPROJECT} --billing-account 0X0X0X-0X0X0X-0X0X0X
```

### enable container services

this command might take a minute, it enables the google cloud container services APIs on your project

```
   ./gcloud.sh services enable container.googleapis.com
```

### create cluster

gke-demo is your cluster name.

```
   ./gcloud.sh container clusters create gke-demo \
      --enable-ip-alias --num-nodes=1 --release-channel=rapid
```

### update kubecfg for docker

Since we're running gcloud in docker via this script, we need to change the kube config so that it can find our gcloud command.

edit your ~/.kube/config, find the cmd-path for glcoud and replace it with something like this:

```
    cmd-path: $GITHUB_PATH/trying-to-play-along/google-gke/gcloud.sh
```

replace GITHUB_PATH with the path where this repo is checked out

optionally, you could symlink gcloud to the script in this directory


### test kubectl 

at this point, your kubectl should work locally.  test it out with the following commands

```
    kubectl get nodes
    kubectl get namespaces
    kubectl get pods -A
```

### enable GKE ingress controller

```
    ./gcloud.sh container clusters update gke-demo --update-addons=HttpLoadBalancing=ENABLED
```

note: upgrading the cluster this way will cause the cluster to be unavailable for a moment.

### adding more nodes to your  cluster

If you find that you need to add more nodes to your cluster, use this gcloud command:

```
    ./gcloud.sh container clusters resize gke-demo \
      --node-pool default-pool --num-nodes 3 --quiet
```


### cleanup

to cleanup you can just delete your whole project

```
   ./gcloud.sh projects delete ${GKEPROJECT} --quiet
```
