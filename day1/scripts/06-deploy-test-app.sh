#!/bin/bash
set -e

helm upgrade --install nginx-test ../helm/nginx-test \
  --namespace $NAMESPACE \
  --create-namespace \
  --set image.repository=asia-southeast1-docker.pkg.dev/$PROJECT_ID/$ARTIFACT_REPO/nginx-test \
  --set image.tag=$IMAGE_TAG
