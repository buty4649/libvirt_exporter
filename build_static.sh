#!/bin/sh

VERSION=0.1.1

docker build -t libvirt_exporter:$VERSION .
container_id=$(docker run -d libvirt_exporter:$VERSION)
docker cp ${container_id}:libvirt_exporter .
docker stop $container_id
tar zcf libvirt_exporter-${VERSION}.tar.gz libvirt_exporter
