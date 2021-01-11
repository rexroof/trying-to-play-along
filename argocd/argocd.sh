# docker build -t argocd .

docker run --rm \
  -v "$PWD/.argocd:/root/.argocd" \
  -it argocd $@
