#!/bin/bash
set -e

kubectl create namespace $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -

kubectl apply -f - <<EOF
apiVersion: v1
kind: ResourceQuota
metadata:
  name: ${NAMESPACE}-quota
  namespace: $NAMESPACE
spec:
  hard:
    cpu: "8"
    memory: 16Gi
EOF
