#!/bin/bash
set -e

echo "Updating App Runner service..."

aws apprunner update-service \
  --service-arn "$SERVICE_ARN" \
  --region "$AWS_REGION" \
  --source-configuration file://source-config.json
