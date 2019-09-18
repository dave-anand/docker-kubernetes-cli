FROM anand000/docker-terraform-cli

ENV KUBECONFIG=/root/.kube/config

# Install `kubeclt` and `argocd cli`
RUN \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

# `kubeclt` basic config / setup
RUN \
    mkdir -p /root/.ssh $KUBECONFIG \
    && rmdir $KUBECONFIG

ENTRYPOINT /bin/bash
