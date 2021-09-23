#!/bin/bash -eu

base_dir="$(
  cd "$(dirname "$0")/.."
  pwd
)"

echo "----- build -----"
image_name="djangogirls"
registry_image_name="$DOCKER_HUB_USERNAME/$image_name"

docker build --no-cache -t "$registry_image_name" "$base_dir"

echo "----- push -----"
echo "$DOCKER_HUB_PASSWORD" | docker login -u "$DOCKER_HUB_USERNAME" --password-stdin
docker push "$registry_image_name"
