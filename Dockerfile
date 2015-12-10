FROM alpine:latest
MAINTAINER Thibault NORMAND <me@zenithar.org>

RUN apk add --update -t build-deps wget unzip \
    && wget --no-check-certificate https://releases.hashicorp.com/nomad/0.2.1/nomad_0.2.1_linux_amd64.zip \
    && unzip nomad_0.2.1_linux_amd64.zip \
    && mv nomad /usr/bin/nomad \
    && chmod +x /usr/bin/nomad \
    && mkdir /data \
    && addgroup nomad \
    && adduser -s /bin/false -G nomad -S -D nomad \
    && apk del --purge build-deps \
    && rm -rf /var/cache/apk/*

USER        nomad
EXPOSE      4646 4647 4648/tcp 4648/udp
VOLUME      ["/data"]
WORKDIR     /data
ENTRYPOINT  ["/usr/bin/nomad"]
CMD         ["-h"]
