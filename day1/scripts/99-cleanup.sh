#!/bin/bash
helm uninstall nginx-test -n $NAMESPACE
kubectl delete pod load-generator -n $NAMESPACE
