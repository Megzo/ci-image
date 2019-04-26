FROM ubuntu:18.04

RUN apt-get update && apt-get install -y docker.io prometheus-node-exporter snmpd curl
RUN curl -sfL https://get.k3s.io | sh -
COPY snmpd.conf /etc/snmp/snmpd.conf

ENTRYPOINT ["/usr/local/bin/k3s server", "server", "--docker"]
