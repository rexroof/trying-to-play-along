#!/bin/sh
docker run --rm -it \
  -v "${PWD}/.config:/root/.config" \
  -v "${HOME}/.kube/:/root/.kube/" \
  digitalocean/doctl $@
