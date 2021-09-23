#!/bin/bash -eu

docker_dir="$1"
image_name="$(basename "$docker_dir")"
registry_image_name="$DOCKER_HUB_USERNAME/$image_name"

echo "----- build: $registry_image_name -----"
docker build --no-cache -t "$registry_image_name" "$docker_dir"

echo "----- push: $registry_image_name -----"
echo "$DOCKER_HUB_PASSWORD" | docker login -u "$DOCKER_HUB_USERNAME" --password-stdin
docker push "$registry_image_name"
