FROM alpine:latest
MAINTAINER Thibault NORMAND <me@zenithar.org>

RUN apk add --update -t build-deps wget unzip \
    && wget --no-check-certificate https://releases.hashicorp.com/nomad/0.2.1/nomad_0.2.1_linux_amd64.zip \
    && unzip nomad_0.2.1_linux_amd64.zip \
    && mv vault /usr/bin/nomad \
    && chmod +x /usr/bin/nomad \
    && mkdir /data \
    && addgroup nomad \
    && adduser -s /bin/false -G nomad -S -D nomad \
    && apk del --purge build-deps \
    && rm -rf /var/cache/apk/*

USER        nomad
EXPOSE      8200
VOLUME      ["/data"]
WORKDIR     /data
ENTRYPOINT  ["/usr/bin/nomad"]
CMD         ["-h"]
