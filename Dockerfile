FROM progrium/consul:latest
MAINTAINER Wes Morgan <cap10morgan@gmail.com>

ENV GOMAXPROCS 10

COPY ./etcd-bootstrap /bin/etcd-bootstrap

ENTRYPOINT ["/bin/etcd-bootstrap"]
CMD []
