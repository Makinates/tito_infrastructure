#!/bin/bash
# This script checks if a directory exists

DIRECTORY="/Users/tito/Desktop/tito_pro"

if [ -d "$DIRECTORY" ]; then
    echo "Directory exists."
else
    echo "Directory does not exist. Creating now..."
    mkdir $DIRECTORY
    echo "Directory created."
fi

