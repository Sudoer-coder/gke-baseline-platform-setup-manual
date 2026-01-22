#!/bin/bash
kubectl run load-generator \
  --image=busybox \
  -n $NAMESPACE \
  -- /bin/sh -c "while true; do wget -q -O- http://nginx-test; done"
