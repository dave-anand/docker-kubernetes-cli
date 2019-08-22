FROM anand000/docker-terraform-cli

ENV ARGOCD_VERSION=v1.1.2
ENV KUBECONFIG=/root/.kube/config

# Install `kubeclt` and `argocd cli`
RUN \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl \
    && curl -SL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/${ARGOCD_VERSION}/argocd-linux-amd64 \
    && chmod +x /usr/local/bin/argocd

# `kubeclt` basic config / setup
RUN \
    mkdir -p /root/.ssh $KUBECONFIG \
    && rmdir $KUBECONFIG

ENTRYPOINT /bin/bash
