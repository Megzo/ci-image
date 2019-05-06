FROM ubuntu:18.04

RUN apt-get update && apt-get install -y docker.io prometheus-node-exporter snmpd wget
RUN wget https://github.com/rancher/k3s/releases/download/v0.4.0/k3s
RUN chmod 744 k3s
RUN mv k3s /usr/local/bin/k3s
RUN ln -s /usr/local/bin/k3s /usr/local/bin/kubectl
COPY snmpd.conf /etc/snmp/snmpd.conf
VOLUME /var/lib/rancher/k3s 
VOLUME /var/lib/cni
VOLUME /var/log

ENTRYPOINT ["/usr/local/bin/k3s", "server"]
