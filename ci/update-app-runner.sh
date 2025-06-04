#!/bin/bash
set -e

echo "Updating App Runner service..."

aws apprunner update-service \
  --service-arn "$SERVICE_ARN" \
  --region "$AWS_REGION" \
  --source-configuration file://source-config.json > /dev/null 2>&1

echo "Update initiated successfully."
