#!/bin/bash

# Usage:
# ./rollback.sh 20260117143210

VERSION=$1
BUCKET="alok-ci-cd-artifact"
REGION="ap-south-1"

if [ -z "$VERSION" ]; then
  echo "Usage: ./rollback.sh <version>"
  exit 1
fi

echo "Rolling back to version: $VERSION"

aws s3 cp \
  s3://$BUCKET/releases/$VERSION/index.html \
  s3://$BUCKET/current/index.html \
  --region $REGION

echo "Rollback completed."
