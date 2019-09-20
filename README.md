# Kubernetes (kubectl) Docker Container

This is a containerized Kubernetes CLI (`kubectl`) based on `anand000/docker-terraform-cli`.

> This container includes the AWS CLI and the Terraform v0.12.x binary.

[![DockerHub Badge](http://dockeri.co/image/anand000/docker-kubernetes-cli)](https://hub.docker.com/r/anand000/docker-kubernetes-cli/)

## Example build

```
docker build -t anand000/docker-kubernetes-cli .
```

## Example usage

> The example below (keys) assumes an existing AWS account.


**Ensure the following are set**

```
export AWS_ACCESS_KEY_ID="<aws_access_key_id>"
export AWS_SECRET_ACCESS_KEY="<aws_secret_access_key>"
export AWS_DEFAULT_REGION="<aws_default_region>"
```

**Run the container detatched**
```
docker run --name docker-kubernetes-cli \
    --rm \
    --detach \
    --tty \
    --env "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
    --env "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
    --env "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" \
    anand000/docker-kubernetes-cli
```

**Run a command**

> While this is obviously a very simple example, more complex usage, particularly in a CI/CD pipeline, is possible.

```
docker exec -it docker-kubernetes-cli kubectl version 
```

> Ensure `export USER=argocd` to run `argocd` successfully.

## References

[Overview of kubectl](https://kubernetes.io/docs/reference/kubectl/overview/)
[Amazon EKS User Guide](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)

# License

Licensed under the Apache License, Version 2.0 (the "License").

This repository and its contents are licensed under the terms detailed in the [LICENSE file](./LICENSE).

