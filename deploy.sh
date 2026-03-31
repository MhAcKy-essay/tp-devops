#!/bin/bash

# Variables
IMAGE_NAME="devops-app"
CONTAINER_NAME="devops-container"
PORT=${1:-5001}  # Argument ou 5000 par défaut

# Stop ancien container
if [ $(docker ps -a -q -f name=$CONTAINER_NAME) ]; then
    echo "Suppression de l'ancien container..."
    docker stop $CONTAINER_NAME 2>/dev/null || true
    docker rm $CONTAINER_NAME
fi

# Build image
docker build -t $IMAGE_NAME .

# Run container
docker run -d -p $PORT:5000 --name $CONTAINER_NAME $IMAGE_NAME

# Messages
echo "App déployée sur localhost:$PORT"
echo "Déploiement terminé"
