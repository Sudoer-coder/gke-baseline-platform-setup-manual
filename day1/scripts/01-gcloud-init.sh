#!/bin/bash
set -e

gcloud auth login
gcloud config set project $PROJECT_ID
gcloud config set compute/region $REGION
