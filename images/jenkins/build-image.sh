#!/bin/bash

# Variables
TAGNAME="ats-jenkins-image"

echo "Building new image with tag: $TAGNAME"

docker build --tag=$TAGNAME .