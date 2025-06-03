#!/bin/bash
set -e

echo "Fetching secret from AWS Secrets Manager..."

SECRET_JSON=$(aws secretsmanager get-secret-value \
  --secret-id "$SECRET_NAME" \
  --region "$AWS_REGION" \
  --query SecretString \
  --output text)

echo "Generating source-config.json..."

cat > source-config.json <<EOF
{
  "ImageRepository": {
    "ImageIdentifier": "public.ecr.aws/nginx/nginx:stable-perl",
    "ImageRepositoryType": "ECR_PUBLIC",
    "ImageConfiguration": {
      "Port": "80",
      "RuntimeEnvironmentVariables": $SECRET_JSON
    }
  }
}
EOF

