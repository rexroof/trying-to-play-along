mkdir -p .azure
docker run --rm -w /root \
  -v "${PWD}/.azure:/root/.azure" \
  -v "${HOME}/.kube:/root/.kube" \
  -it mcr.microsoft.com/azure-cli az $@
