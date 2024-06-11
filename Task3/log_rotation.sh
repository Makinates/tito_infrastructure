#!/bin/bash

# Define log file and backup location
log_file="/Users/tito/Desktop/TF_school/TF-manifests/ec2-instance.tf"
backup_dir="/Users/tito/Desktop/TF_school/TF-manifests/myec2_backup"

# Create backup directory if it doesn't exist
mkdir -p $backup_dir

# Rotate log file
cp $log_file $backup_dir/ec2-instance.tf.$(date +%Y%m%d)
> $log_file

echo "Log file rotated." 
