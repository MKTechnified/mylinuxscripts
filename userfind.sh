#!/bin/bash

read -p "Enter username: " USER

if id "$USER" &>/dev/null; then
	echo "User Exists."
else
	echo "User does not exists."
fi
