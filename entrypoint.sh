#! /bin/sh
chown -R nomad:nomad /data
/usr/bin/gosu nomad /usr/bin/nomad $@
