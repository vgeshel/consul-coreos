FROM consul:0.7.2
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

RUN apk add --update bash && rm -rf /var/cache/apk/*

ENV GOMAXPROCS 10
ENV DOCKER_VERSION 1.11.2

RUN curl -L --retry 5 --retry-delay 1 -o /tmp/docker.tgz https://get.docker.com/builds/Linux/x86_64/docker-$DOCKER_VERSION.tgz && \
    tar -xz -C /tmp -f /tmp/docker.tgz && \
    mv /tmp/docker/docker /bin/docker && \
    chmod +x /bin/docker && \
    rm -rf /tmp/docker && rm -rf /tmp/docker.tgz

COPY ./etcd-bootstrap /bin/etcd-bootstrap
COPY config/* /consul/config/

ENTRYPOINT ["/bin/etcd-bootstrap"]
CMD [""]
