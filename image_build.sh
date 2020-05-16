#!/bin/bash
cp config/database.yml.k8s config/database.yml
docker build -t  xiaopang:master  .
docker tag xiaopang:master ccr.ccs.tencentyun.com/crystal/xiaopang:master
docker push ccr.ccs.tencentyun.com/crystal/xiaopang:master
cp config/database.yml.default config/database.yml
docker image prune -f
#docker images | grep none | awk '{ print $3; }' | xargs docker rmi --force




