#!/bin/bash
cp config/database.yml.k8s config/database.yml
cp config/property/property.k8s.yml config/property.yml
cp .dockerignore.base .dockerignore

docker build -t  xiaopang:master  .
docker tag xiaopang:master ccr.ccs.tencentyun.com/crystal/xiaopang:master
docker push ccr.ccs.tencentyun.com/crystal/xiaopang:master


rm -rf public/assets
rm -rf public/packs
bundle exec rake assets:precompile
cp .dockerignore.static .dockerignore
docker build -t  xiaopang.static:master  -f docker/static.assets  .
docker tag xiaopang.static:master ccr.ccs.tencentyun.com/crystal/xiaopang.static:master
docker push ccr.ccs.tencentyun.com/crystal/xiaopang.static:master

# reset the config to local
cp config/database.yml.default config/database.yml
cp config/property/property.local.yml config/property.yml

echo "" > .dockerignore
#docker image prune -f
docker images | grep none | awk '{ print $3; }' | xargs docker rmi --force




