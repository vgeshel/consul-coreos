FROM gliderlabs/consul-server:0.6
MAINTAINER Vadim Geshel, <vadim@yummly.com>

ENV GOMAXPROCS 10
ENV DOCKER_VERSION 1.8.3

RUN apk add --update bash

ADD https://get.docker.io/builds/Linux/x86_64/docker-${DOCKER_VERSION} /bin/docker
RUN chmod +x /bin/docker

COPY ./etcd-bootstrap /bin/etcd-bootstrap

ENTRYPOINT ["/bin/etcd-bootstrap"]
CMD []
