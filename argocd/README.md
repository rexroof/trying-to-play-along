# ArgoCD setup

followed along with this:

[Getting Started Guide](https://argoproj.github.io/argo-cd/getting_started/)

### install argocd services into argocd namespace

create an argocd namespace and apply the install manifest

```
    kubectl create namespace argocd
    kubectl apply -n argocd -f argocd-install.yaml
```

### change argocd server service to load balancer

From the getting started docs, patch the service to create a load balancer

```
   kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```

### build docker container for argocd cli tool

```
   docker build -t argocd .
```

### use argocd.sh to log into your new cluster.

after your load balancer has been created, you can log in using argocd cli:

the default login/password are `admin/<argocd-server-pod-name>`

```
    ./argocd.sh login <load-balancer-hostname>
```


### once you are logged in, there are two examples for creating applications:


first example:   run `./deploy_guestbook.sh`

second example:   apply the `kuard-application.yaml` manifest to generate an application using kubectl

``` 
    kubectl apply -f kuard-application.yaml
```
