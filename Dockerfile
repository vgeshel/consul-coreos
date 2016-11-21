FROM consul:0.7.1
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

RUN apk add --update bash && rm -rf /var/cache/apk/*

ENV GOMAXPROCS 10
ENV DOCKER_VERSION 1.11.2

ADD https://get.docker.io/builds/Linux/x86_64/docker-${DOCKER_VERSION} /bin/docker
RUN chmod +x /bin/docker

COPY ./etcd-bootstrap /bin/etcd-bootstrap
COPY config/* /consul/config/

ENTRYPOINT ["/bin/etcd-bootstrap"]
CMD []
