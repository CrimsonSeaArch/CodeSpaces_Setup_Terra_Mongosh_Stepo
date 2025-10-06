#!/bin/bash

echo "Setup der CodeSpaces-Umgebung beginnt"

# MongoDB Shell Installation
echo "Installation MongoDB Shell (mongosh)..."

# Import MongoDB public GPG key
wget -qO- https://www.mongodb.org/static/pgp/server-7.0.asc | sudo tee /etc/apt/trusted.gpg.d/mongodb.asc

# Add MongoDB repository
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# Update package list
sudo apt-get update

# Install mongosh
sudo apt-get install -y mongodb-mongosh

# Verify installations
echo ""
echo "Installation abgeschlossen!"
echo ""
echo "Terraform version:"
terraform version
echo ""
echo "Mongosh version:"
mongosh --version
echo ""
echo "CodeSpace mit MongoDB Atlas + Terraform erstellt!"

# Werden keine 2 Versionen ausgegeben, deutet das auf ein nicht korrekt gelaufenes Script hin.