#!/bin/bash
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run --rm \
 -v "${SCRIPTDIR}/.config:/root/.config/" \
 -v "${HOME}/.kube/:/root/.kube/" \
 google/cloud-sdk:latest gcloud $@
