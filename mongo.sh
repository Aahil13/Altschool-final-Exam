#!/bin/bash

# Import the MongoDB public GPG key
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add -

# Install gnupg if it is not already installed
apt-get install -y gnupg

# Add the MongoDB repository to the list of sources
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Update the package list
apt-get update

# Install MongoDB
apt-get install -y mongodb-org

# Start MongoDB
service start mongod

# Enable MongoDB to start on boot
service enable mongod
