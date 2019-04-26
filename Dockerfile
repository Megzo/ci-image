FROM ubuntu:18.04

RUN apt-get update && apt-get install -y docker.io prometheus-node-exporter snmpd wget
RUN wget https://github.com/rancher/k3s/releases/download/v0.4.0/k3s
RUN chmod 744 k3s
RUN mv k3s /usr/bin/k3s
COPY snmpd.conf /etc/snmp/snmpd.conf

ENTRYPOINT ["/usr/bin/k3s", "server", "--docker"]
