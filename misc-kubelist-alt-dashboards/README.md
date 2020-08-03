# Kubernetes Dashboards and kubectl Alternatives

List stolen from Kubelist email list:  <https://kubelist.com/issue/91>

## prelim steps

create kind cluster with ingress enabled
add metrics-server
add example applications

## the tools!

- k9s <https://k9scli.io/>

single binary, can read metrics from metrics-server

- kubelive <https://github.com/ameerthehacker/kubelive>

nodejs kubectl client.   

try nodejs in docker:

```
  docker run --rm -it --network=host --volume $HOME/.kube/config:/root/.kube/config   node bash
```

- kube ops view <https://github.com/hjacobs/kube-ops-view>
- kubernetes resource report <https://github.com/hjacobs/kube-resource-report>
- octant <https://octant.dev/docs/master/index.html>
- weave scope <https://github.com/weaveworks/scope>
