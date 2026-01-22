#!/bin/bash
set -e

IMAGE_URI="asia-southeast1-docker.pkg.dev/$PROJECT_ID/$ARTIFACT_REPO/$IMAGE_NAME:$IMAGE_TAG"

docker build -t $IMAGE_URI .
docker push $IMAGE_URI
