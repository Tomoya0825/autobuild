FROM ubuntu:20.04

COPY xorgxrdp-0.2.13.tar.gz /opt/
COPY xrdp_0.9.13-1_amd64.deb /opt/

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt
RUN apt install ./xrdp_0.9.13-1_amd64.deb
RUN grep '^deb ' /etc/apt/sources.list | sed 's/^deb/deb-src/g' > /etc/apt/sources.list.d/deb-src.list
RUN sed -i -e 's/archive.ubuntu.com/jp.archive.ubuntu.com/' /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y build-essential checkinstall
RUN apt-get build-dep -y xorgxrdp
RUN tar xzf xorgxrdp-0.2.13.tar.gz

WORKDIR /opt/xorgxrdp-0.2.13
RUN ./bootstrap
RUN ./configure XRDP_CFLAGS=-I~/git/neutrino/xrdp/common XRDP_LIBS=" "
RUN make
RUN checkinstall -y -D --pkgname=xorgxrdp
