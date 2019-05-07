FROM ubuntu:18.04

RUN apt-get update && apt-get install -y nfs-common wget
RUN wget https://github.com/rancher/k3s/releases/download/v0.5.0/k3s && \
    chmod 744 k3s && \
    mv k3s /usr/local/bin/k3s && \
    ln -s /usr/local/bin/k3s /usr/local/bin/kubectl

VOLUME /var/lib/rancher/k3s 
VOLUME /var/lib/cni
VOLUME /var/log

ENTRYPOINT ["/usr/local/bin/k3s", "server"]
