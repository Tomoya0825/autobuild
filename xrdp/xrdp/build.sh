#!/bin/sh
wget https://github.com/neutrinolabs/xrdp/releases/download/v0.9.13/xrdp-0.9.13.tar.gz
docker build -t xrdp:0.9.13 ./ --no-cache
docker run --name xrdp -itd xrdp:0.9.13 /bin/bash
docker cp xrdp:/opt/xrdp-0.9.13/xrdp_0.9.13-1_amd64.deb ./
docker stop xrdp
docker rm xrdp
docker rmi xrdp:0.9.13
