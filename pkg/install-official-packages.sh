#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo "must run as root"
        exit
fi

echo "=====> downloading official packages"
echo
# requires sudo
pacman -Sy --needed $(<official-packages.txt)

