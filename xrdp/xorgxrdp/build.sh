#!/bin/sh
wget https://github.com/neutrinolabs/xorgxrdp/releases/download/v0.2.13/xorgxrdp-0.2.13.tar.gz
docker build -t xorgxrdp:0.2.13 ./ --no-cache
docker run --name xorgxrdp -itd xorgxrdp:0.2.13 /bin/bash
docker cp xorgxrdp:/opt/xorgxrdp-0.2.13/xorgxrdp_0.2.13-1_amd64.deb ./
docker stop xorgxrdp
docker rm xorgxrdp
docker rmi xorgxrdp:0.2.13
