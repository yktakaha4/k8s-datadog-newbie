#!/bin/bash -eu

namespace="kube-system"
secret_name="k8s-datadog-newbie-secret"

kubectl delete secret -n "$namespace" "$secret_name" 2>/dev/null || echo "skip delete."
kubectl create secret generic -n "$namespace" "$secret_name" \
  --from-literal="DATADOG_API_KEY=$DATADOG_API_KEY"
