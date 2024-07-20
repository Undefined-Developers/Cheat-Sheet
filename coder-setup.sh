#!/bin/bash

# Download and install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Export NVM_DIR environment variable
export NVM_DIR="$HOME/.nvm"

# Load nvm
if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
fi

# Load nvm bash_completion
if [ -s "$NVM_DIR/bash_completion" ]; then
    . "$NVM_DIR/bash_completion"
fi

# Install Node.js v20 using nvm
nvm install v20

# Install global npm packages
npm i -g yarn typescript tsx pm2 npm@latest npm-check-updates

# Update packages cache
sudo apt-get update -y

# Upgrade packages
sudo apt-get upgrade -y

# Install postgresql
sudo apt-get install postgresql postgresql-contrib -y

# Start psql without systemd cause it's coder docker env
sudo service postgresql start

# Install nano cause I like it
sudo apt-get install nano -y

# Install redis
sudo apt-get install redis -y

# Start redis
sudo service redis-server start

# Setup one-time local database for testing 
sudo -u postgres psql -c "CREATE USER alpha WITH LOGIN PASSWORD 'SomeSecureAlpha';"
sudo -u postgres psql -c "CREATE DATABASE alpha OWNER alpha;" 

# Restart terminal
reset