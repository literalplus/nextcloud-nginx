#!/usr/bin/env bash

docker build -t images.lit.plus/nextcloud-nginx:latest . && \
  docker push images.lit.plus/nextcloud-nginx:latest
