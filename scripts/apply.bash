#!/bin/bash -eu

base_dir="$(
  cd "$(dirname "$0")/.."
  pwd
)"

namespace="k8s-datadog-newbie"
secret_name="k8s-datadog-newbie-secret"

echo "----- apply: namespace -----"
kubectl apply -f "$base_dir/k8s/namespace.yml"

echo "----- apply: secret -----"
kubectl delete secret -n "$namespace" "$secret_name" 2>/dev/null || echo "skip delete."
kubectl create secret generic -n "$namespace" "$secret_name" \
  --from-literal="DATADOG_API_KEY=$DATADOG_API_KEY"

echo "----- apply: manifest -----"
kubectl apply -f "$base_dir/k8s/k8s-datadog-newbie.yml"
