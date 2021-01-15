#!/bin/bash
cp config/database.yml.k8s config/database.yml
cp config/property/property.k8s.yml config/property.yml
cp .dockerignore.base .dockerignore

docker build -t  xiaopang:master  .
docker tag xiaopang:master ccr.ccs.tencentyun.com/crystal/xiaopang:master
docker push ccr.ccs.tencentyun.com/crystal/xiaopang:master

# reset the config to local
cp config/database.yml.default config/database.yml
cp config/property/property.local.yml config/property.yml

#docker image prune -f
docker images | grep none | awk '{ print $3; }' | xargs docker rmi --force




