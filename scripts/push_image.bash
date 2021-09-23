#!/bin/bash -eu

base_dir="$(
  cd "$(dirname "$0")/.."
  pwd
)"

echo "----- build -----"
image_name="djangogirls"

docker build --no-cache -t "$image_name" "$base_dir"

echo "----- push -----"
account_id="$(aws sts get-caller-identity --query Account --output text)"
region="${AWS_DEFAULT_REGION:-"ap-northeast-1"}"
ecr_uri="$account_id.dkr.ecr.$region.amazonaws.com"
ecr_image_name="$ecr_uri/$image_name"

aws ecr get-login-password | docker login --username AWS --password-stdin "https://$ecr_uri"
docker tag "$image_name" "$ecr_image_name"
docker push "$ecr_image_name"
