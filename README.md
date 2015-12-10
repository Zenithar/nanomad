# Nano Nomad

Hashicorp Nomad docker on Alpine Linux

```
#> docker run -ti -v /tmp/nomad:/data zenithar/nanomad:latest agent -server -bootstrap-expect=1 -data-dir=/data
```
