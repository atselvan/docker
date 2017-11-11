#!/bin/bash

# Variables
TAGNAME="ats-sonarqube-image"

echo "Building new image with tag: $TAGNAME"

docker build --tag=$TAGNAME .
