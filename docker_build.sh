#!/bin/bash
docker build -t  xiaopang:master  .
docker tag xiaopang:master ccr.ccs.tencentyun.com/crystal/xiaopang:master
docker push ccr.ccs.tencentyun.com/crystal/xiaopang:master


