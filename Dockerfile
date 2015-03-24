FROM progrium/consul:latest
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

ENV GOMAXPROCS 10

COPY ./etcd-bootstrap /bin/etcd-bootstrap

ENTRYPOINT ["/bin/etcd-bootstrap"]
CMD []
