#!/usr/bin/env bash

set -e
set -o pipefail
set -o xtrace

# IMPORTANT: For this to work, you need to
#   pacman -Syu qemu-user-static qemu-user-static-binfmt

IMG="images.lit.plus/nextcloud-nginx:latest"

if podman image exists $IMG; then
  podman image rm $IMG
fi

podman manifest create $IMG
podman build --platform linux/amd64,linux/arm64 --manifest $IMG .
podman manifest push $IMG
