#!/bin/sh

docker run --rm \
 -v "${PWD}/.config:/root/.config/" \
 -v "${HOME}/.kube/:/root/.kube/" \
 google/cloud-sdk:latest gcloud $@
