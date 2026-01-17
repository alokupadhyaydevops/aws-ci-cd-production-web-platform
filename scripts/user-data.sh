#!/bin/bash
set -e

# Install required packages
yum update -y
yum install -y nginx aws-cli cronie

# Enable and start services
systemctl enable nginx
systemctl start nginx
systemctl enable crond
systemctl start crond

# Variables
BUCKET="alok-ci-cd-artifact"
REGION="ap-south-1"
DEST="/usr/share/nginx/html/index.html"
AWS="/usr/bin/aws"

CMD="$AWS s3 cp s3://$BUCKET/current/index.html $DEST --region $REGION"

# Initial download
$CMD

# Create cron job to keep app updated
echo "* * * * * root $CMD >> /var/log/s3-sync.log 2>&1" > /etc/cron.d/s3-sync
chmod 644 /etc/cron.d/s3-sync

# Restart cron
systemctl restart crond
