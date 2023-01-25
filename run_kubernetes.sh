#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=biyyot/ml-micro

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy ml-micro --image=biyyot/ml-micro --port 80

# Step 3:
# List kubernetes pods
kubectl get pod
# Step 4:
# Forward the container port to a host
sudo kubectl port-forward pod/ml-micro-f649ff7fc-7hr5s --address 0.0.0.0 8000:80
