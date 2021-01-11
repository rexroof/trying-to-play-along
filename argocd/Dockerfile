FROM ubuntu:20.10
# from curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/'
ARG VERSION=v1.8.2
RUN apt-get update && apt-get install -y curl
RUN curl -sSL -o /usr/local/bin/argocd "https://github.com/argoproj/argo-cd/releases/download/${VERSION}/argocd-linux-amd64"
RUN chmod 0755 /usr/local/bin/argocd
ENTRYPOINT ["/usr/local/bin/argocd"]
