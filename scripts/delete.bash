#!/bin/bash -eu

base_dir="$(
  cd "$(dirname "$0")/.."
  pwd
)"

echo "----- delete: namespace -----"
kubectl delete namespace k8s-datadog-newbie
