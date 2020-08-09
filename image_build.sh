#!/bin/bash
cp config/database.yml.k8s config/database.yml
cp .dockerignore.base .dockerignore

docker build -t  xiaopang:master  .
docker tag xiaopang:master ccr.ccs.tencentyun.com/crystal/xiaopang:master
docker push ccr.ccs.tencentyun.com/crystal/xiaopang:master


bundle exec rake assets:precompile
cp .dockerignore.static .dockerignore
docker build -t  xiaopang.static:master  -f docker/static.assets  .
docker tag xiaopang.static:master ccr.ccs.tencentyun.com/crystal/xiaopang.static:master
docker push ccr.ccs.tencentyun.com/crystal/xiaopang.static:master


cp config/database.yml.default config/database.yml
echo "" > .dockerignore
#docker image prune -f
docker images | grep none | awk '{ print $3; }' | xargs docker rmi --force




