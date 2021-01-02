#!env bash

docker run --rm -it  \
  -w /app \
  -v $PWD:/app \
  -v $HOME/.aws:/root/.aws \
  -v $HOME/.kube:/root/.kube \
weaveworks/eksctl:0.35.0 $@
