#!/bin/bash

# Update the system packages
yum update -y

# Install essential packages for CodeDeploy agent
yum install -y ruby wget

# Download and install the CodeDeploy agent
cd /home/ec2-user
wget https://aws-codedeploy-eu-west-3.s3.eu-west-3.amazonaws.com/latest/install
chmod +x ./install
./install auto

# Start and enable the CodeDeploy agent
systemctl start codedeploy-agent
systemctl enable codedeploy-agent
