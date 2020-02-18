#!/bin/bash

if [ "$EUID" -eq 0 ]
    then echo "do not run as root"
        exit
fi

ln -sf ${HOME}/.config/nvim/init ${HOME}/.vimrc
