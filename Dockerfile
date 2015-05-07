FROM ubuntu:trusty

WORKDIR /var/etcd
VOLUME ["/var/etcd"]
EXPOSE 4001 7001

RUN apt-get install -y curl

RUN cd /tmp; \
    curl -kL http://github.com/coreos/etcd/releases/download/v2.0.10/etcd-v2.0.10-linux-amd64.tar.gz > /tmp/etcd.tar.gz; \
    tar -xvzf /tmp/etcd.tar.gz; \
    mkdir -p /usr/local; \
    mv /tmp/etcd-v2.0.10-linux-amd64 /usr/local/etcd; \
    rm -rf /tmp/*;

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/usr/local/etcd/etcd"]
