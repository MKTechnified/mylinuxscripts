#!/bin/bash

read -p "Enter username: " INPUT_USER
CURRENT_USER=$(whoami)

if id "$INPUT_USER" &>/dev/null; then
    if [ "$INPUT_USER" == "$CURRENT_USER" ]; then
        echo "You cannot delete the currently logged-in user: $CURRENT_USER"
        exit 1
    fi

    read -p "Are you sure you want to delete user '$INPUT_USER'? [Y/n]: " CONFIRM
    if [[ $CONFIRM == [yY] ]]; then
        sudo deluser "$INPUT_USER"
        echo "User '$INPUT_USER' has been deleted."
    else
        echo "User NOT deleted."
    fi
else
    echo "User NOT found."
fi
