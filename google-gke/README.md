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
   ./gcloud.sh config set compute/zone us-west1-a
   ./gcloud.sh project create gkedemo2021
   ./gcloud config set project gkedemo2021
```

after this, you will need to activate billing on this project.  
do that by going to the cloud console under billing:
[Google Cloud Console Billing](https://console.cloud.google.com/billing/projects)


### create cluster

gke-demo is your cluster name.

```
   ./gcloud.sh container clusters create gke-demo --num-nodes=1 --release-channel=rapid
```


### cleanup

to cleanup you can just delete your whole project

```
   ./gcloud.sh project delete gkedemo2021
```
