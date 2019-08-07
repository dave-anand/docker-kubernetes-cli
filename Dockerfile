FROM anand000/docker-terraform-cli

ENV KUBECONFIG=/root/.kube/config

RUN \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

RUN \
    mkdir -p /root/.ssh /root/.kube/config \
    && rmdir /root/.kube/config

ENTRYPOINT /bin/bash
