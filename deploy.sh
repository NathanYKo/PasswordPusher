#!/bin/bash

# Pull the latest changes
git pull origin main

# Generate a new SECRET_KEY_BASE if not already set
if [ -z "$SECRET_KEY_BASE" ]; then
    export SECRET_KEY_BASE=$(openssl rand -hex 64)
    echo "Generated new SECRET_KEY_BASE"
fi

# Build and start the containers
docker-compose up -d --build

echo "Deployment completed successfully!"