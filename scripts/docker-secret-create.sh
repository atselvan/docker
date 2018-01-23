#!/bin/bash

# Input params
SECRET_NAME=$1
SECRET=$2

# Validation
if [[ $# -lt 2 || $# -gt 2 ]]; then
    echo "Usage : ./docker-secret-create.sh <SECRET_NAME> <SECRET>"
    exit 1
fi

# Create secret
echo $SECRET | docker secret create $SECRET_NAME -