FROM ubuntu:20.04

COPY xrdp-0.9.13.tar.gz /opt/

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt
RUN grep '^deb ' /etc/apt/sources.list | sed 's/^deb/deb-src/g' > /etc/apt/sources.list.d/deb-src.list
RUN sed -i -e 's/archive.ubuntu.com/jp.archive.ubuntu.com/' /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y build-essential checkinstall libpixman-1-dev
RUN apt-get build-dep -y xrdp
RUN tar xzf xrdp-0.9.13.tar.gz

WORKDIR /opt/xrdp-0.9.13
RUN ./bootstrap
RUN ./configure --enable-vsock --enable-fuse --enable-ipv6 --enable-jpeg --enable-pixman --enable-pam
RUN make
RUN checkinstall -y -D --pkgname=xrdp
