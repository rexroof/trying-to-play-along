docker run --rm -it \
 -v "${PWD}/.config:/root/.config/" \
 google/cloud-sdk:latest gcloud $@
