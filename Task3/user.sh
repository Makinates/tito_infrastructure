#!/bin/bash
# This script adds a new user

USERNAME=$1

if id "$USERNAME" &>/dev/null; then
    echo "User $USERNAME already exists."
else
    sudo useradd $USERNAME
    echo "User $USERNAME created."
fi

