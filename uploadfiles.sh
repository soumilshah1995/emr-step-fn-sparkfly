#!/bin/bash

# Set variables for S3 bucket and file paths
S3_BUCKET="XXX"
BOOTSTRAP_FILE="/Users/soumilshah/IdeaProjects/emr-labs/emr-step-functions/step-functions/bootstrap.sh"
SPARK_FILE="/Users/soumilshah/IdeaProjects/emr-labs/emr-step-functions/step-functions/test_job.py"


# Upload config.yaml
aws s3 cp "$BOOTSTRAP_FILE" "s3://$S3_BUCKET/scripts/bootstrap.sh"
aws s3 cp "$SPARK_FILE" "s3://$S3_BUCKET/scripts/test_job.py"



# Download and upload customer.parquet
curl -s https://shell.duckdb.org/data/tpch/0_01/parquet/customer.parquet | aws s3 cp - s3://$S3_BUCKET/raw/customer.parquet


echo "Files uploaded successfully to S3 bucket: $S3_BUCKET"
